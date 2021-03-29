//
//  CharacterDetailContract.swift
//  ClassRiders
//
//  Created by Rober Garrido on 25/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit
import CoreBluetooth
import PromiseKit

protocol CharacterDetailEntityContract: BaseEntity {
    
}

protocol CharacterDetailViewContract: BaseViewController {
    var presenter: CharacterDetailPresenterContract! { get set }
    
    func reloadViewWithData(character: CharacterElement)
    
}

protocol CharacterDetailPresenterContract: BasePresenter {
    var view: CharacterDetailViewContract! { get set }
    var interactor: CharacterDetailInteractorContract! { get set }
    var entity: CharacterDetailEntityContract! { get set }
    var wireframe: CharacterDetailWireframeContract! { get set }

    func viewWillAppear()
    func viewDidLoad()
    
}

protocol CharacterDetailInteractorContract: BaseInteractor {
    var output: CharacterDetailInteractorOutputContract! {get set}
    
    func getCharacterData() -> CharacterElement
}

protocol CharacterDetailInteractorOutputContract: class {
    
}

protocol CharacterDetailWireframeContract: BaseWireframe {
    var output: CharacterDetailWireframeOutputContract! { get set }
    var view: UIViewController! { get set }
    
    func showBasicLoading(text: String)
    func hideBasicLoading(completion: @escaping (() -> Void))
}

protocol CharacterDetailWireframeOutputContract: class {

}
