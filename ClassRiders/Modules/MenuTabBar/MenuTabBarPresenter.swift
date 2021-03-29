//
//  MenuTabBarPresenter.swift
//  ClassRiders
//
//  Created by Rober Garrido on 29/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

class MenuTabBarPresenter: BasePresenter, MenuTabBarPresenterContract {

    weak var view: MenuTabBarViewContract!
    var interactor: MenuTabBarInteractorContract!
    var entity: MenuTabBarEntityContract!
    var wireframe: MenuTabBarWireframeContract!

    func viewWillAppear() {

    }
    
    func viewDidLoad() {
       
    }

    func getTabBarViewController() -> [BaseViewController] {
        let characterList = CharacterListBuilder.build()
        let formsView = FormBuilder.build()
        
        

        return [characterList, formsView]
    }
}

// MARK: - MenuTabBarInteractorOutputContract
extension MenuTabBarPresenter: MenuTabBarInteractorOutputContract {
    
}

// MARK: - MenuTabBarWireframeOutputContract
extension MenuTabBarPresenter: MenuTabBarWireframeOutputContract {
    
}
