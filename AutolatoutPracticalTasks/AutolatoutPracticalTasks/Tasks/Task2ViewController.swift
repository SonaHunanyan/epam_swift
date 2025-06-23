//
//  Task2.swift
//  AutolatoutPracticalTasks
//
//  Created by Kakhaberi Kiknadze on 20.03.25.
//

import UIKit

// Build a UI programmatically with a UIButton positioned below a UILabel.
// The button should be centered horizontally and have a fixed distance from the label.
// Adjust the layout to handle different screen sizes.
final class Task2ViewController: UIViewController {
    let button = UIButton()
    let label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        renderLabel()
        renderButton()
    }
    
    func renderLabel() -> Void {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello is Barev"
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func renderButton() -> Void {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        var config = UIButton.Configuration.filled()
        config.titlePadding = 8
        config.baseBackgroundColor = .systemBlue
        button.configuration = config
        button.layer.cornerRadius = 16
        button.setTitle("Tap Me", for: .normal)
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

#Preview {
    Task2ViewController()
}
