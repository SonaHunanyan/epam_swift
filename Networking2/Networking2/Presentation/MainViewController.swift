//
//  ViewController.swift
//  Networking2
//
//  Created by Sona Hunanyan on 16.07.25.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        TVShowsRepository.getTVShows { result in
            DispatchQueue.main.sync {
                switch result{
                case .success(let data):
                    print(data)
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }

    private func setup(){
        view.backgroundColor = .white
    }
}

