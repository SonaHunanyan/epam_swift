//
//  ViewController.swift
//  EpamCalculator
//
//  Created by Sona Hunanyan on 09.06.25.
//

import UIKit

class HomeScreenController: UIViewController {
    
    let mainView = CalculatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
    }


}

