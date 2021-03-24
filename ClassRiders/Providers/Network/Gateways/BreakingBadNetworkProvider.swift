//
//  BreakingBadNetworkProvider.swift
//  ClassRiders
//
//  Created by Rober Garrido on 24/3/21.
//

import Foundation
import PromiseKit

protocol BreakingBadProviderContract {
    func getAllCharacters() -> Promise<[BreakingBadDAO]>
}

class BreakingBadNetworkProvider: BaseNetworkProvider, BreakingBadProviderContract {
    enum BreakingBadURLEntries {
        case kInitialPage
        case kDetailCharacter(String)
    }

    enum BreakingBadNetworkError: Error {
        case initialPageLoadError, detailPageLoadError
    }

    let kAPIResultsKey = "results"
    let kAPIUrlKey = "url"

    func getAllCharacters() -> Promise<[BreakingBadDAO]> {
        var detailPagePromise: [Promise<BreakingBadDAO>] = []

        return Promise<[BreakingBadDAO]> { promise in

            self.getInitialPage().done { initialPage in
                for element in initialPage {
                    if let detailUrl = element[self.kAPIUrlKey] {
                        detailPagePromise.append(self.getCharacterDetail(fullURLString: detailUrl))
                    }
                }

                when(resolved: detailPagePromise).done { results in
                    var fullfilledPromiseValues: [BreakingBadDAO] = []
                    for case .fulfilled(let value) in results {
                        // These promises succeeded, and the values will be what is return from
                        // the last promises in chain1 and chain2
                        print("Promise value is: \(value)")
                        fullfilledPromiseValues.append(value)
                    }

                    debugPrint(results)

                    promise.fulfill(fullfilledPromiseValues)
                }.catch { error in
                    debugPrint(error)
                    //promise.reject(error)
                }
            }.catch { error in
                promise.reject(error)
            }
        }
    }

    private func getUrl(service: BreakingBadURLEntries) -> URL {
        switch service {
        case .kInitialPage:
            return URL(string: "https://www.breakingbadapi.com/api/characters")!
        case .kDetailCharacter(let characterId):
            return URL(string: "https://www.breakingbadapi.com/api/\(characterId)/")!
        }
    }

    private func getInitialPage() -> Promise<[[String: String]]> {
        return Promise<[[String: String]]> { promise in
            sessionManager.request(getUrl(service: .kInitialPage)).responseJSON { response in
                guard let initialData = try? response.result.get() as? [String: Any],
                      let initialDataResults = initialData[self.kAPIResultsKey] as? [[String: String]] else {
                    promise.reject(BreakingBadNetworkError.initialPageLoadError)
                    return
                }

                promise.fulfill(initialDataResults)
            }
        }
    }

    private func getCharacterDetail(fullURLString: String) -> Promise<BreakingBadDAO> {
        return Promise<BreakingBadDAO> { promise in
            sessionManager.request(fullURLString).responseJSON { response in
                guard let detailPageData = try? response.result.get() as? [String: Any] else {
                    promise.reject(BreakingBadNetworkError.detailPageLoadError)
                    return
                }

                if let breakingBadDAO = try? BreakingBadDAO(JSON: detailPageData) {
                    promise.fulfill(breakingBadDAO)
                } else {
                    promise.reject(BreakingBadNetworkError.detailPageLoadError)
                }
            }
        }
    }
}
