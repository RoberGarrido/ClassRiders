//
//  CharacterListContract.swift
//  ClassRiders
//
//  Created by Rober Garrido on 24/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit
import PromiseKit
import CoreBluetooth

protocol CharacterListEntityContract: BaseEntity {
    
}

protocol CharacterListViewContract: BaseViewController {
    var presenter: CharacterListPresenterContract! { get set }
    
    func updateCharacterData(characters: [Character])
    func feedbackError (error: Error)
    
}

protocol CharacterListPresenterContract: BasePresenter {
    var view: CharacterListViewContract! { get set }
    var interactor: CharacterListInteractorContract! { get set }
    var entity: CharacterListEntityContract! { get set }
    var wireframe: CharacterListWireframeContract! { get set }
    
    func viewWillAppear()
    func viewDidLoad()
    
    func selectCharacterCell(index: Int) -> ()
    
}

protocol CharacterListInteractorContract: BaseInteractor {
    var output: CharacterListInteractorOutputContract? {get set}
    
    func getCharactersList()-> Promise<[Character]>
}

protocol CharacterListInteractorOutputContract: class {
    
}

protocol CharacterListWireframeContract: BaseWireframe {
    var output: CharacterListWireframeOutputContract? { get set }
    var view: UIViewController? { get set }
    
    func showBasicLoading(text: String)
    func hideBasicLoading(completion: @escaping (() -> Void))
    func showDetailCharacterView(character: Character) -> ()
}

protocol CharacterListWireframeOutputContract: class {

}

