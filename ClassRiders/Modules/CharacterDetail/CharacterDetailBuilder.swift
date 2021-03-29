//
//  CharacterDetailBuilder.swift
//  ClassRiders
//
//  Created by Rober Garrido on 25/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class CharacterDetailBuilder {

    static func build(character: CharacterElement) -> CharacterDetailView {
        let view = CharacterDetailView.init(nibName: String(describing: CharacterDetailView.self), bundle: nil)
        let presenter = CharacterDetailPresenter()
        let entity = CharacterDetailEntity()
        let wireframe = CharacterDetailWireframe()
        
        let provider = BreakingBadNetworkProvider()
        let interactor = CharacterDetailInteractor(provider: provider, character: character)
        
        view.presenter = presenter
        view.presenter.view = view
        view.presenter.entity = entity
        view.presenter.interactor = interactor
        view.presenter.interactor.output = presenter
        view.presenter.wireframe = wireframe
        
        view.presenter.wireframe.output = presenter
        view.presenter.wireframe.view = view
        
        return view
    }
}
