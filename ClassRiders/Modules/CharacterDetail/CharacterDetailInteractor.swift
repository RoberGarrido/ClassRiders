//
//  CharacterDetailInteractor.swift
//  ClassRiders
//
//  Created by Rober Garrido on 25/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

class CharacterDetailInteractor: BaseInteractor, CharacterDetailInteractorContract {
    weak var output: CharacterDetailInteractorOutputContract!

    var networkProvider: BreakingBadNetworkProvider
    var character: Character
    
    init (provider: BreakingBadNetworkProvider, character: Character) {
        self.networkProvider = provider
        self.character = character
    }
    
    func getCharacterData() -> Character {
        return character
    }
}
