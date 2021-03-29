//
//  CharacterDetailView.swift
//  ClassRiders
//
//  Created by Rober Garrido on 25/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class CharacterDetailView: BaseViewController, CharacterDetailViewContract {

    var presenter: CharacterDetailPresenterContract!
    
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    

    var datasource: CharacterDetailDataSource!
    // swiftlint:disable:next weak_delegate
    var delegate: CharacterDetailDelegate!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewWillAppear()
    }

    private func setupView() {
        //headerImage.makeRounded()

        // Setup tableview
        tableView.register(UINib(nibName: CharacterDetailTableViewCell.cellId, bundle: nil),
                           forCellReuseIdentifier: CharacterDetailTableViewCell.cellId)
        datasource = CharacterDetailDataSource()
        delegate = CharacterDetailDelegate()
        tableView.dataSource = datasource
        tableView.delegate = delegate
    }
    
    func reloadViewWithData(character: CharacterElement) {
        headerImage.sd_setImage(with: URL(string: character.img!)!, completed: nil)

        datasource.characterData = genericData(character: character)
        tableView.reloadData()
    }
    
    private func genericData(character: CharacterElement) -> [String: String] {
        var characterData: [String: String] = [:]

        characterData["name"] = character.name
        characterData["birthday"] = character.birthday.map { $0.rawValue }
        characterData["status"] = character.status?.rawValue
        characterData["nickname"] = character.nickname
        characterData["portrayed"] = character.portrayed
        characterData["category"] = character.category.map { $0.rawValue }

        return characterData
    }
}

class CharacterDetailDataSource: NSObject, UITableViewDataSource {
    var characterData: [String: String]!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterDetailTableViewCell.cellId,
                                                 // swiftlint:disable:next force_cast
                                                 for: indexPath) as! CharacterDetailTableViewCell

        cell.setData(title: Array(characterData.keys)[indexPath.item],
                     value: Array(characterData.values)[indexPath.item])

        return cell
    }
}

class CharacterDetailDelegate: NSObject, UITableViewDelegate {

}


