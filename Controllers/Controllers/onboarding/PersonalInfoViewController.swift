//
//  PersonalInfoViewController.swift
//  Controllers
//
//  Created by Sona Hunanyan on 29.06.25.
//

import UIKit

class PersonalInfoViewController: UIViewController {
    
    private let nameTextField = UITextField()
    private let phoneTextField = UITextField()
    private let confirmButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        render()
    }
    
    private func setupTextField(textField: UITextField) {
        textField.borderStyle = .roundedRect
        NSLayoutConstraint.activate([
            textField.widthAnchor.constraint(equalToConstant: 300)
        ])
        textField.addTarget(self, action: #selector(onTextFieldChanged), for: .editingChanged)
    }
    
    private func setupNameTextField() {
        nameTextField.placeholder = "Name"
        setupTextField(textField: nameTextField)
    }
    
    private func setupPhoneTextField() {
        phoneTextField.placeholder = "Phone number"
        setupTextField(textField: phoneTextField)
        phoneTextField.keyboardType = .phonePad
    }
    
    private func setupConfirmButton() {
        confirmButton.layer.cornerRadius = 10
        confirmButton.backgroundColor = .systemBlue
        confirmButton.setTitle("Confirm", for: .normal)
        confirmButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        confirmButton.isEnabled = false
        confirmButton.layer.opacity = 0.5
        confirmButton.addTarget(self, action: #selector(onConfirm), for: .touchUpInside)
        NSLayoutConstraint.activate([
            confirmButton.widthAnchor.constraint(equalToConstant: 100),
            confirmButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func render(){
        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 16
        let items = [nameTextField, phoneTextField, confirmButton]
        for i in items {
            stackView.addArrangedSubview(i)
        }
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        setupNameTextField()
        setupPhoneTextField()
        setupConfirmButton()
    }
    
    @objc private func onTextFieldChanged() {
        let isNameValid = nameTextField.text?.isEmpty == false
        let isPhoneValid = (phoneTextField.text?.count ?? 0) >= 9
        let isValid = isNameValid && isPhoneValid
        confirmButton.isEnabled = isValid
        confirmButton.layer.opacity = isValid ? 1 : 0.5
    }
    
    @objc private func onConfirm() {
        let name = nameTextField.text ?? ""
        let phone = phoneTextField.text ?? ""
        let alert = UIAlertController(
                  title: "Confirm Information",
                  message: "Please confirm your name and phone number. Name: \(name), Phone: \(phone).",
                  preferredStyle: .alert
              )
              alert.addAction(UIAlertAction(title: "Edit", style: .cancel))
              alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { _ in
                  let user = User(name: name, phone: phone)
                  let controller = PreferencesViewController()
                  controller.user = user
                  self.navigationController?.pushViewController(controller, animated: true)
              }))
              
              present(alert, animated: true)
    }
    
}
