//
//  ViewController.swift
//  Streams8
//
//  Created by Sona Hunanyan on 19.08.25.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @Published var isLoading: Bool = false
    private var cancellables = Set<AnyCancellable>()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        initListener()
        isLoading = true
        isLoading = false
    }
    
    private func initListener() {
        $isLoading.sink { value in
        print("Is loading \(value)")
        }.store(in: &cancellables)
    }


}

