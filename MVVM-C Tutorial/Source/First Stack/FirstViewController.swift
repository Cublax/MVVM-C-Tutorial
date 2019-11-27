//
//  FirstViewController.swift
//  MVVM-C Tutorial
//
//  Created by Alexandre Quiblier on 19/11/2019.
//  Copyright © 2019 Alexandre Quiblier. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var firstLabel: UILabel!
    
    // MARK: - Properties
    
    var viewModel: FirstViewModel!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewDidLoad()
    }
}
