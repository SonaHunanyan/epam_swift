//
//  SettingsController.swift
//  Controllers
//
//  Created by Sona Hunanyan on 29.06.25.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let toggleSwitch = UISwitch()
    private let toggleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        render()
    }
    
    private func render() {
        toggleLabel.text = "Navigation is easy!"
        toggleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        toggleSwitch.isOn = true
        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        let items = [toggleLabel,toggleSwitch]
        for i in items {
            stackView.addArrangedSubview(i)
            NSLayoutConstraint.activate([
                stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        }
    }
}
