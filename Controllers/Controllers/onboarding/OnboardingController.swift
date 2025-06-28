//
//  OnboardingController.swift
//  Controllers
//
//  Created by Sona Hunanyan on 29.06.25.
//

import UIKit

class OnboardingController: UIViewController {
    let button = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        renderStartButton()
    }
    
    private func renderStartButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        button.setTitle("Start", for: .normal)
        button.layer.cornerRadius = 20
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 140),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        button.addTarget(self, action: #selector(onStartButtonTap), for: .touchUpInside)
    }
    
    @objc private func onStartButtonTap() {
        navigationController?.pushViewController(PersonalInfoViewController(), animated: true)
    }
}
