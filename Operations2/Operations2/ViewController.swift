//
//  ViewController.swift
//  Operations2
//
//  Created by Sona Hunanyan on 30.07.25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        createOperation4()
    }

    private func createOperationBloc(_ name: String) ->BlockOperation {
       return BlockOperation {
            print("Operation \"\(name)\" started")
            for _ in 0..<1000000 { }
            print("Operation \"\(name)\" finished")
        }
    }
    
    private func createOperation1() {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 6
        let operationA = createOperationBloc("A")
        let operationB = createOperationBloc("B")
        let operationC = createOperationBloc("C")
        let operationD = createOperationBloc("D")
        
        queue.addOperations([operationA, operationB, operationC, operationD], waitUntilFinished: true)
    }
    
    private func createOperation2() {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 2
        let operationA = createOperationBloc("A")
        let operationB = createOperationBloc("B")
        let operationC = createOperationBloc("C")
        let operationD = createOperationBloc("D")
        
        queue.addOperations([operationA, operationB, operationC, operationD], waitUntilFinished: true)
    }
    
    private func createOperation3() {
        let queue = OperationQueue()
        let operationA = createOperationBloc("A")
        let operationB = createOperationBloc("B")
        let operationC = createOperationBloc("C")
        let operationD = createOperationBloc("D")
        
        operationB.addDependency(operationC)
        operationD.addDependency(operationB)
        
        queue.addOperations([operationA, operationB, operationC, operationD], waitUntilFinished: true)
    }
    
    private func createOperation4() {
        let queue = OperationQueue()
        let operationA = createOperationBloc("A")
        let operationB = createOperationBloc("B")
        let operationC = createOperationBloc("C")
        let operationD = createOperationBloc("D")
        
        operationA.queuePriority = .low
        
        queue.addOperations([operationA, operationB, operationC, operationD], waitUntilFinished: true)
    }
}

