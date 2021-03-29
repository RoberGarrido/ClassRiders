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
    
    private func genericData(character: CharacterElement) -> CharactersData {
        var characterData: CharactersData = [:]

        characterData[0] = ("name", character.name)
        characterData[1] = ("birthday", character.birthday.map { $0.rawValue })
        characterData[2] = ("status", character.status?.rawValue)
        characterData[3] = ("nickname", character.nickname)
        characterData[4] = ("portrayed", character.portrayed)
        characterData[5] = ("category", character.category.map { $0.rawValue })

        return characterData
    }
}

typealias CharactersData = [Int: (String, String?)]

class CharacterDetailDataSource: NSObject, UITableViewDataSource {
    var characterData: CharactersData!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterDetailTableViewCell.cellId,
                                                 // swiftlint:disable:next force_cast
                                                 for: indexPath) as! CharacterDetailTableViewCell
        if let data = characterData [indexPath.row] {
            cell.setData(title: data.0,
                         value: data.1 ?? "")
        }
        

        return cell
    }
}

class CharacterDetailDelegate: NSObject, UITableViewDelegate {

}


