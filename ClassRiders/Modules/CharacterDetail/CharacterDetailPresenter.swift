//
//  CharacterDetailPresenter.swift
//  ClassRiders
//
//  Created by Rober Garrido on 25/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

class CharacterDetailPresenter: BasePresenter, CharacterDetailPresenterContract {

    weak var view: CharacterDetailViewContract!
    var interactor: CharacterDetailInteractorContract!
    var entity: CharacterDetailEntityContract!
    var wireframe: CharacterDetailWireframeContract!

    func viewDidLoad() {

    }

    func viewWillAppear() {
        let characterData = interactor.getCharacterData()
        view.reloadViewWithData(character: characterData)
    }
}


// MARK: - CharacterDetailInteractorOutputContract
extension CharacterDetailPresenter: CharacterDetailInteractorOutputContract {
    
}

// MARK: - CharacterDetailWireframeOutputContract
extension CharacterDetailPresenter: CharacterDetailWireframeOutputContract {
    
}
