//
//  CharacterListInteractor.swift
//  ClassRiders
//
//  Created by Rober Garrido on 24/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import PromiseKit

class CharacterListInteractor: BaseInteractor, CharacterListInteractorContract {
    weak var output: CharacterListInteractorOutputContract?

    var characterProvider: BreakingBadProviderContract
    
    init (characterProvider: BreakingBadProviderContract) {
        self.characterProvider = characterProvider
    }
    
    // MARK: - Public methods
    func getCharacterList() -> Promise<[Character]> {
        return Promise<[Character]> { promise in
            firstly {
                self.characterProvider.getAllCharacters()
            }.done { charactersDAOList in
                let charactersList = charactersDAOList.map { Character(breakingBadDAO: $0) }
                
                promise.fulfill(charactersList)
            }
        }
    }
}
