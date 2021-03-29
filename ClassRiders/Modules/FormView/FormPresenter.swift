//
//  FormPresenter.swift
//  ClassRiders
//
//  Created by Rober Garrido on 29/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

class FormPresenter: BasePresenter, FormPresenterContract {
    
    weak var view: FormViewContract!
    var interactor: FormInteractorContract!
    var entity: FormEntityContract!
    var wireframe: FormWireframeContract!

    func viewDidLoad() {

    }

    func viewWillAppear() {

    }

    func sendAction() {
        interactor.sendLoginData(username: "", email: "", password: "")
    }
}

// MARK: - FormInteractorOutputContract
extension FormPresenter: FormInteractorOutputContract {
    
}

// MARK: - FormWireframeOutputContract
extension FormPresenter: FormWireframeOutputContract {
    
}
