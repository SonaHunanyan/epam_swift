//
//  ViewController.swift
//  Operations3
//
//  Created by Sona Hunanyan on 30.07.25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        createSimpleOperation()
    }

    
    private func createOperationBlock(_ name: String, onCancelOperation: (() -> Void)? = nil) -> BlockOperation {
        return BlockOperation {
            print("Operation \"\(name)\" started")
             for _ in 0..<1_000_000 {
                 // do nothing
             }
             print("Operation \"\(name)\" finished")
            
            if let action = onCancelOperation {
                action()
            }
        }
    }
    
    private func createOperation(cancelB: Bool = false){
        let queue = OperationQueue()
        let operationB = createOperationBlock("B")
        let operationA = cancelB ? createOperationBlock("A", onCancelOperation: {
            operationB.cancel()
        }): createOperationBlock("A")
        operationB.addDependency(operationA)
        queue.addOperation(operationB)
        queue.addOperation(operationA)
    }
    
    private func createSimpleOperation() {
        createOperation()
    }
    
    private func createOperationWithCancelation() {
        createOperation(cancelB: true)
    }

}

