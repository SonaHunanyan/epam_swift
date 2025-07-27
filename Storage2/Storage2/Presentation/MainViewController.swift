//
//  ViewController.swift
//  Storage2
//
//  Created by Sona Hunanyan on 28.07.25.
//

import UIKit

class MainViewController: UIViewController {
    private let logoutButton = UIButton(type: .system)
    private let emailLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }

    private func setup() {
        let email = AuthStore.instance.getEmail()
        emailLabel.text = "Welcome, \(email ?? "User")"
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailLabel)
        view.addSubview(logoutButton)
        NSLayoutConstraint.activate([
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoutButton.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func logoutTapped() {
        AuthStore.instance.logout()
        let loginVC = LoginViewController()
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = loginVC
        }
    }
}


