//
//  LoginViewController.swift
//  Storage2
//
//  Created by Sona Hunanyan on 28.07.25.
//


import UIKit

class LoginViewController: UIViewController {
    private let emailTextField = UITextField()
    private let loginButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }

    private func setup() {
        emailTextField.placeholder = "Enter email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailTextField)
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: 200),
            loginButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func loginTapped() {
        guard let email = emailTextField.text, !email.isEmpty else { return }
        AuthStore.instance.saveEmail(email)
        AuthStore.instance.updateLoggedInStatus(status: true)
        transitionToMain()
    }

    private func transitionToMain() {
        let mainVC = MainViewController()
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = mainVC
        }
    }
}
