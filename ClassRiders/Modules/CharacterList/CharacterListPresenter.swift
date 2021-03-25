//
//  CharacterListPresenter.swift
//  ClassRiders
//
//  Created by Rober Garrido on 24/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import PromiseKit

class CharacterListPresenter: BasePresenter, CharacterListPresenterContract {

    weak var view: CharacterListViewContract!
    var interactor: CharacterListInteractorContract!
    var entity: CharacterListEntityContract?
    var wireframe: CharacterListWireframeContract?
    
    var charactersList: [Character] = []

    func viewDidLoad() {

    }

    func viewWillAppear() {
        // get initial data to populate the view
        firstly {
            interactor.getCharactersList()
        }.done { [weak self] charactersListData in
            self?.charactersList = charactersListData
            self?.view.updateCharacterData(characters: charactersListData)
        }.catch { error in
            self.view.feedbackError(error: error)
        }
    }
}


// MARK: - CharacterListInteractorOutputContract
extension CharacterListPresenter: CharacterListInteractorOutputContract {
    
}

// MARK: - CharacterListWireframeOutputContract
extension CharacterListPresenter: CharacterListWireframeOutputContract {
    
}
