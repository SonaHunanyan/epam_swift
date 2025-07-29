//
//  ViewController.swift
//  Operations1
//
//  Created by Sona Hunanyan on 29.07.25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        operationQueue()
    }

    
    private func operationToRun() {
        print("Operation \"A\" started")
         for _ in 0..<1000000 {
            // do nothing
         }
         print("Operation \"A\" finished")
    }

    private func operationQueue() {
        OperationQueue().addOperation {
            self.operationToRun()
        }
    }
    
    private func mainQueue() {
        OperationQueue.main.addOperation {
            self.operationToRun()
        }
    }
    
}

