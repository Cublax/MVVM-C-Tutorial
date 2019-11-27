//
//  Screens.swift
//  MVVM-C Tutorial
//
//  Created by Alexandre Quiblier on 19/11/2019.
//  Copyright © 2019 Alexandre Quiblier. All rights reserved.
//

import UIKit

final class Screens {
    
    // MARK: - Properties
    
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: Screens.self))
}

// MARK: - FirstViewController

extension Screens {
    func createFirstViewController() -> UIViewController {
        let viewController = storyboard.instantiateViewController(identifier: "FirstViewController") as! FirstViewController
        let viewModel = FirstViewModel()
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: - SecondViewController

extension Screens {
    func createSecondViewController() -> UIViewController {
        let viewController = storyboard.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        let viewModel = SecondViewModel()
        viewController.viewModel = viewModel
        return viewController
    }
}
