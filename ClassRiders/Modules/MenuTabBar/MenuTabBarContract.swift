//
//  MenuTabBarContract.swift
//  ClassRiders
//
//  Created by Rober Garrido on 29/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit
import PromiseKit

protocol MenuTabBarEntityContract: BaseEntity {
    
}

protocol MenuTabBarViewContract: BaseViewController {
    var presenter: MenuTabBarPresenterContract! { get set }
    
}

protocol MenuTabBarPresenterContract: BasePresenter {
    var view: MenuTabBarViewContract! { get set }
    var interactor: MenuTabBarInteractorContract! { get set }
    var entity: MenuTabBarEntityContract! { get set }
    var wireframe: MenuTabBarWireframeContract! { get set }

    func viewDidLoad()
    func viewWillAppear()
}

protocol MenuTabBarInteractorContract: BaseInteractor {
    var output: MenuTabBarInteractorOutputContract! {get set}
}

protocol MenuTabBarInteractorOutputContract: class {
    
}

protocol MenuTabBarWireframeContract: BaseWireframe {
    var output: MenuTabBarWireframeOutputContract! { get set }
    var view: UIViewController! { get set }
    
    func showBasicLoading(text: String)
    func hideBasicLoading(completion: @escaping (() -> Void))
}

protocol MenuTabBarWireframeOutputContract: class {

}
