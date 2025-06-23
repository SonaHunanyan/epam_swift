//
//  Task3ViewController.swift
//  AutolatoutPracticalTasks
//
//  Created by Kakhaberi Kiknadze on 20.03.25.
//

import UIKit
import Combine

// Lay out login screen as in the attached screen recording.
// 1. Content should respect safe area guides
// 2. Content should be visible on all screen sizes
// 3. Content should be spaced on bottom as in the recording
// 4. When keyboard appears, content should move up
// 5. When you tap the screen and keyboard gets dismissed, content should move down
// 6. You can use container views/layout guides or any option you find useful
// 7. Content should have horizontal spacing of 16
// 8. Title and description labels should have a vertical spacing of 12 from each other
// 9. Textfields should have a spacing of 40 from top labels
// 10. Login button should have 16 spacing from textfields
final class Task3ViewController: UIViewController {
    private let titleLabel = UILabel()
    private let bodyLabel = UILabel()
    private let usernameField = UITextField()
    private let passwordField = UITextField()
    private let logInButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupGestures()
        setupKeybordVisibility()
    }
    
    private func setupGestures() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
    }
    
    @objc private func endEditing() {
        view.endEditing(true)
    }
    
    private func setupView() {
        setupLabels()
        setupTextFields()
        setupButton()
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        let items = [
            titleLabel,
            verticalPadding(12),
            bodyLabel,
            verticalPadding(40),
            usernameField,
            verticalPadding(12),
            passwordField,
            verticalPadding(16),
            logInButton,
        ]
        for i in items {
            stackView.addArrangedSubview(i)
        }
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupLabels() {
        titleLabel.text = "Sign In"
        titleLabel.font = .boldSystemFont(ofSize: 32)
        bodyLabel.numberOfLines = 3
        bodyLabel.text = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit,
        sed do eiusmod tempor incididunt ut labore
        """
    }
    
    private func setupTextFields() {
        usernameField.placeholder = "Enter username"
        passwordField.placeholder = "Enter password"
        usernameField.borderStyle = .roundedRect
        passwordField.borderStyle = .roundedRect
    }
    
    private func setupButton() {
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.tintColor, for: .normal)
    }
    
    private func verticalPadding(_ size: CGFloat) -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            container.heightAnchor.constraint(equalToConstant: size)
        ])
        return container
    }
    
    private func setupKeybordVisibility() {
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func onKeyboardShow(sender: NSNotification){
        let keyboardHeight = getKeyboardHeight(sender: sender)
        view.frame.origin.y = view.frame.origin.y - keyboardHeight
    }
    
    @objc private func getKeyboardHeight(sender: NSNotification) -> CGFloat {
        guard let userInfo = sender.userInfo,
              let keyboardFrameValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return 0
        }
        let keyboardFrame = keyboardFrameValue.cgRectValue
        let keyboardHeight = keyboardFrame.height
        return keyboardHeight
    }
    
    @objc func onKeyboardHide(sender: NSNotification){
        let keyboardHeight = getKeyboardHeight(sender: sender)
        view.frame.origin.y = view.frame.origin.y + keyboardHeight
    }
}

#Preview {
    Task3ViewController()
}
