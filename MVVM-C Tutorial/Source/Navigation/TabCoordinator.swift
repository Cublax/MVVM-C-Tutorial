//
//  TabCoordinator.swift
//  MVVM-C Tutorial
//
//  Created by Alexandre Quiblier on 19/11/2019.
//  Copyright © 2019 Alexandre Quiblier. All rights reserved.
//

import UIKit

// Name of the coordinators/stacks
enum ViewControllerItem: Int {
    case first = 0
    case second = 1
}

protocol TabBarSourceType {
    var items: [UINavigationController] {get set}
}

final class TabBarSource: TabBarSourceType {
    var items: [UINavigationController] = [
        UINavigationController(nibName: nil, bundle: nil),
        UINavigationController(nibName: nil, bundle: nil)
    ]
    
    // Initialise the TabBar items with name and Icons
    init() {
        let firstIcon = UIImage(systemName: "1.circle")
        let filledFirstIcon = UIImage(systemName: "1.circle.fill")
        self[.first].tabBarItem = UITabBarItem(title: "First", image: firstIcon, selectedImage: filledFirstIcon)
        let secondIcon = UIImage(systemName: "2.circle")
        let filledSecondIcon = UIImage(systemName: "2.circle.fill")
        self[.second].tabBarItem = UITabBarItem(title: "Second", image: secondIcon, selectedImage: filledSecondIcon)
    }
}

// transform the index of the item in "items" into a case of the enum ViewControllerItem
extension TabBarSourceType {
    subscript(item: ViewControllerItem) -> UINavigationController {
        get {
            guard !items.isEmpty, item.rawValue < items.count, item.rawValue >= 0 else {
                fatalError("Item does not exist")
            }
            return items[item.rawValue]
        }
    }
}

final class TabCoordinator: NSObject {
    
    // MARK: - Properties
    
    private let presenter: UIWindow
    
    private let tabBarController: UITabBarController
    
    private let screens: Screens
    
    private var firstCoordinator: FirstCoordinator?
    
    private var secondCoordinator: SecondCoordinator?
    
    private var source: TabBarSource = TabBarSource()
    
    // MARK: - Initializer
    
    init(presenter: UIWindow) {
        self.presenter = presenter
        
        self.screens = Screens()
        tabBarController = UITabBarController(nibName: nil, bundle: nil)
        tabBarController.viewControllers = source.items
        tabBarController.selectedViewController = source[.first]
        super.init()
        
        tabBarController.delegate = self
    }
    
    func start() {
        presenter.rootViewController = tabBarController
        showFirstTab()
    }
    
    private func showFirstTab() {
        firstCoordinator = FirstCoordinator(presenter: source[.first], screens: screens)
        firstCoordinator?.start()
    }
    
    private func showSecondTab() {
        secondCoordinator = SecondCoordinator(presenter: source[.second], screens: screens)
        secondCoordinator?.start()
    }
}

// get the rawvalue of the selected item, and call the relative func show()
extension TabCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let index = tabBarController.selectedIndex
        guard index < source.items.count, let item = ViewControllerItem(rawValue: index) else {
            fatalError("Index out of range")
        }
        
        switch item {
        case .first:
            showFirstTab()
        case .second:
            showSecondTab()
        }
    }
}
