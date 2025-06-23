//
//  Task4ViewController.swift
//  AutolatoutPracticalTasks
//
//  Created by Kakhaberi Kiknadze on 20.03.25.
//

import UIKit

// Create a view with two subviews aligned vertically when in Compact width, Regular height mode.
// If the orientation changes to Compact-Compact, same 2 subviews should be aligned horizontally.
// Hou can use iPhone 16 simulator for testing.
final class Task4ViewController: UIViewController {
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForTraitChanges()
        setupView()
        
    }
    
    private func setupView() {
        let container1 = renderContainer(.systemBlue)
        let container2 = renderContainer(.systemRed)
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(container1)
        stackView.addArrangedSubview(container2)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            container1.heightAnchor.constraint(equalToConstant: 200),
            container2.heightAnchor.constraint(equalToConstant: 200),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    private func registerForTraitChanges() {
        let sizeTraits: [UITrait] = [UITraitVerticalSizeClass.self, UITraitHorizontalSizeClass.self]
        registerForTraitChanges(sizeTraits) { (self: Self, previousTraitCollection: UITraitCollection) in
            if previousTraitCollection.verticalSizeClass == .regular {
                self.stackView.axis = .horizontal
            }
          else if previousTraitCollection.verticalSizeClass == .compact {
                self.stackView.axis = .vertical
            }
            print("Trait collection changed:", self.traitCollection)
        }
    }
    
    private func renderContainer(_ color: UIColor) -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            container.heightAnchor.constraint(equalToConstant: 200)
        ])
        container.backgroundColor = color
        return container
    }
}

#Preview {
    Task4ViewController()
}
