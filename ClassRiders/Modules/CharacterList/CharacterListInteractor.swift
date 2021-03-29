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
    
    func getCharactersList() -> Promise<[CharacterElement]> {
        return Promise<[CharacterElement]> { promise in
            firstly {
                self.characterProvider.getCharacters()
            }.done { charactersList in
                
                promise.fulfill(charactersList)
            }.catch { error in
                promise.reject(error)
            }
        }
    }
}


