//
//  ViewController.swift
//  Streams7
//
//  Created by Sona Hunanyan on 19.08.25.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    private let buttonPressed = PassthroughSubject<Int, Never>()
    private var count = 0
    private let button = UIButton(type: .system)
    private let label = UILabel()
    private var cancellables = Set<AnyCancellable>()



    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        initListener()
    }

    private func setup() {
        view.addSubview(button)
        button.setTitle("Press", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(onButtonTap), for: .touchUpInside)
        label.textColor = .black
        setLabel()
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: button.centerYAnchor, constant: -100),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func initListener() {
        buttonPressed.sink { value in
            self.count = value
            self.setLabel()
        }.store(in: &cancellables)
    }
    
    @objc private func onButtonTap() {
        buttonPressed.send(self.count + 1)
    }
    
    private func setLabel() {
        label.text = "Count is \(count)"
    }

}

