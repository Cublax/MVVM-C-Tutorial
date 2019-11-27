//
//  SecondViewController.swift
//  MVVM-C Tutorial
//
//  Created by Alexandre Quiblier on 19/11/2019.
//  Copyright © 2019 Alexandre Quiblier. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var secondLabel: UILabel!
    
    // MARK: - Properties
    
    var viewModel: SecondViewModel!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewDidLoad()
    }
}
