//
//  AppCoordinator.swift
//  MVVM-C Tutorial
//
//  Created by Alexandre Quiblier on 19/11/2019.
//  Copyright © 2019 Alexandre Quiblier. All rights reserved.
//

import UIKit

final class AppCoordinator {
    
    // MARK: - Properties
    
    private unowned var sceneDelegate: SceneDelegate
    
    private var tabcoordinator: TabCoordinator?
    
    // MARK: - Initializer
    
    init(sceneDelegate: SceneDelegate) {
        self.sceneDelegate = sceneDelegate
    }
    
    // MARK: - Coordinator
    
    func start() {
        tabcoordinator = TabCoordinator(presenter: sceneDelegate.window!)
        tabcoordinator?.start()
    }
}
