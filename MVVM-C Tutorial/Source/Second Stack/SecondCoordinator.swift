//
//  SecondCoordinator.swift
//  MVVM-C Tutorial
//
//  Created by Alexandre Quiblier on 19/11/2019.
//  Copyright © 2019 Alexandre Quiblier. All rights reserved.
//

import UIKit

final class SecondCoordinator {
    
    // MARK: - Properties
    
    private let presenter: UINavigationController
    
    private let screens: Screens
    
    // MARK: - Initializer
    
    init(presenter: UINavigationController, screens: Screens) {
        self.presenter = presenter
        self.screens = screens
    }
    
    // MARK: - Coordinator
    
    func start() {
        showSecondViewController()
    }
    
    private func showSecondViewController() {
        let viewController = screens.createSecondViewController()
        presenter.viewControllers = [viewController]
    }
}
