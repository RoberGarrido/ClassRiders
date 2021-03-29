//
//  CharacterListView.swift
//  ClassRiders
//
//  Created by Rober Garrido on 24/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class CharacterListView: BaseViewController, CharacterListViewContract {

    var presenter: CharacterListPresenterContract!
    
    @IBOutlet weak var tableView: UITableView!
    
    var datasource: CharacterListDataSource!
    // swiftlint:disable:next weak_delegate
    var delegate: CharacterListDelegate!

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
    
    // MARK: - Public methods
    func updateCharacterData(characters: [CharacterElement]) {
        datasource.characters = characters

        tableView.reloadData()
    }

    func feedbackError(error: Error) {
        assert(false, "not implemented")
    }

    // MARK: - Private methods
    private func setupView() {
        // Associate xib table view cell with table view
        tableView.register(UINib(nibName: CharacterListTableViewCell.cellId, bundle: nil),
                           forCellReuseIdentifier: CharacterListTableViewCell.cellId)

        // Setup datasource & delegate
        datasource = CharacterListDataSource()
        delegate = CharacterListDelegate()
        delegate.presenter = presenter

        tableView.dataSource = datasource
        tableView.delegate = delegate

    }
}

class CharacterListDataSource: NSObject, UITableViewDataSource {
    var characters: [CharacterElement] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterListTableViewCell.cellId,
                                                 // swiftlint:disable:next force_cast
                                                 for: indexPath) as! CharacterListTableViewCell
        cell.setUpData(character: characters[indexPath.item])

        return cell
    }
}

class CharacterListDelegate: NSObject, UITableViewDelegate {

    weak var presenter: CharacterListPresenterContract!

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.selectCharacterCell(index: indexPath.item)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}

