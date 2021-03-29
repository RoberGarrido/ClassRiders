//
//  MenuTabBarView.swift
//  ClassRiders
//
//  Created by Rober Garrido on 29/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class MenuTabBarView: BaseTabBarController, MenuTabBarViewContract {

    var presenter: MenuTabBarPresenterContract?

    // MARK: - LifeCycle
    override func loadView() {
        MenuTabBarBuilder.setupPresenter(view: self)
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.viewWillAppear()
    }

    private func setupView() {
        let views = presenter?.getTabBarViewController()

        self.viewControllers = views
        self.selectedIndex = 0
    }
}
