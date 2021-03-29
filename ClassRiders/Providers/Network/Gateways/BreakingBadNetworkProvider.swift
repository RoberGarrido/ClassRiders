//
//  BreakingBadNetworkProvider.swift
//  ClassRiders
//
//  Created by Rober Garrido on 24/3/21.
//

import Foundation
import PromiseKit

protocol BreakingBadProviderContract {
    func getCharacters() -> Promise<[CharacterElement]>
}

class BreakingBadNetworkProvider: BaseNetworkProvider, BreakingBadProviderContract {
    enum BreakingBadURLEntries {
        case kInitialPage
        case kDetailCharacter(String)
    }

    enum BreakingBadNetworkError: Error {
        case initialPageLoadError, detailPageLoadError
    }

    let kAPIResultsKey = "https://www.breakingbadapi.com/api/characters"
    let kAPIUrlKey = "https://www.breakingbadapi.com/api/characters"

    func getCharacters() -> Promise<[CharacterElement]> {
        return self.getInitialPage()
        
    }

    private func getUrl(service: BreakingBadURLEntries) -> URL {
        switch service {
        case .kInitialPage:
            return URL(string: "https://www.breakingbadapi.com/api/characters")!
        case .kDetailCharacter:
            return URL(string: "https://www.breakingbadapi.com/api/character/random")!
        }
    }

    private func getInitialPage() -> Promise<[CharacterElement]> {
        return Promise<[CharacterElement]> { promise in
            sessionManager.request(getUrl(service: .kInitialPage)).validate().responseDecodable(of: [CharacterElement].self) { response in
                
                guard let characters = response.value else {
                    return
                }
                promise.fulfill(characters)
            }
        }
    }

    private func getCharacterDetail(fullURLString: String) -> Promise<[CharacterElement]> {
        return Promise<[CharacterElement]> { promise in
            sessionManager.request(fullURLString).responseJSON { response in
                guard let detailPageData = try? response.result.get() as? [Any] else {
                    promise.reject(BreakingBadNetworkError.detailPageLoadError)
                    return
                }
            }
        }
    }
}


