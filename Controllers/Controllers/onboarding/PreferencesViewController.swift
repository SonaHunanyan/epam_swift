//
//  PreferencesViewController.swift
//  Controllers
//
//  Created by Sona Hunanyan on 29.06.25.
//

import UIKit

class PreferencesViewController: UIViewController {
    private let header = UILabel()
    private let optionsButton = UIButton()
    private let selectedOption = UILabel()
    private  let nextButton = UIButton()
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        render()
    }
    
    private func render() {
        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.alignment = .center
        let items = [header, optionsButton, selectedOption, nextButton]
        for i in items {
            stackView.addArrangedSubview(i)
        }
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        setupHeader()
        setupOptionsButton()
        setupNextButton()
    }
    
    private func setupHeader() {
        header.text = "Select Notification Preference"
        header.textColor = .black
        header.font = .systemFont(ofSize: 26, weight: .bold)
    }
    
    private func setupSelectedOption() {
        header.textColor = .systemBlue
        header.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    
    private func setupButton(title: String, button: UIButton){
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 10
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupOptionsButton() {
        setupButton(title: "Options", button: optionsButton)
        optionsButton.addTarget(self, action: #selector(showActionSheet), for: .touchUpInside)
    }
    
    private func setupNextButton() {
        setupButton(title: "Next", button: nextButton)
        nextButton.isEnabled = false
        nextButton.layer.opacity = 0.5
        nextButton.addTarget(self, action: #selector(onNext), for: .touchUpInside)
    }
    
    @objc private func onNext() {
        let controller = ConfirmDetailsViewController()
        controller.user = user
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func showActionSheet() {
        let alert = UIAlertController(title: "Select Notification Preference", message: nil, preferredStyle: .actionSheet
        )
        let actions = [
            UIAlertAction(title: "Email Notifications", style: .default) { [weak self] _ in
                self?.updateSelectedPreference("Email Notifications")
            },
            UIAlertAction(title: "SMS Notifications", style: .default) { [weak self] _ in
                self?.updateSelectedPreference("SMS Notifications")
            },
            UIAlertAction(title: "Push Notifications", style: .default) { [weak self] _ in
                self?.updateSelectedPreference("Push Notifications")
            },
            UIAlertAction(title: "Cancel", style: .cancel) ]
        
        for i in actions {
            alert.addAction(i)
        }
        present(alert, animated: true)
    }
    
    private func updateSelectedPreference(_ preference: String) {
        nextButton.isEnabled = true
        nextButton.layer.opacity = 1
        user?.notificationPreference = preference
        selectedOption.text = "Notification preference: \(preference)"
    }
    
}
