//
//  ViewController.swift
//  Networking1
//
//  Created by Sona Hunanyan on 13.07.25.
//

import UIKit

class ViewController: UIViewController {
    
    let emailsListView = UIStackView()
    let scrollView = UIScrollView()
    let button = UIButton()
    let loader = UIActivityIndicatorView(style: .large)
    
    private var emails: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        setup()
    }
    
    private func setup() {
        renderEmailsList()
        emailsListView.isHidden = true
        renderLoader()
        setupButton()
    }
    
    private func setupButton(){
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
        button.setTitle("Load", for: .normal)
        button.setTitleColor(.white, for:.normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(onTap), for: .touchUpInside)
    }
    
    @objc private func onTap(){
        loader.startAnimating()
        self.button.isHidden = true
        loadData()
    }
    
    private func renderLoader() {
        view.addSubview(loader)
        loader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func loadData() {
        UserRepository.getUsers {
            result in DispatchQueue.main.sync {
                self.loader.stopAnimating()
                self.loader.isHidden = true
                switch result {
                case .success(let usersResult):
                    self.emailsListView.isHidden = false
                    self.emails = usersResult.map {
                        $0.email
                    }
                    self.updateEmails()
                case .failure(let error):
                    self.showError(error.localizedDescription)
                    self.button.isHidden = false
                }
            }
        }
    }
    
    private func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    
    private func renderEmailsList() {
        view.addSubview(emailsListView)
        view.addSubview(scrollView)
        scrollView.addSubview(emailsListView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        emailsListView.translatesAutoresizingMaskIntoConstraints = false
        emailsListView.axis = .vertical
        emailsListView.spacing = 10
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emailsListView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            emailsListView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        ])
    }
    
    private func updateEmails() {
        emails.forEach {
            emailsListView.addArrangedSubview(renderText($0))
        }
    }
    
    private func renderText(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .black
        return label
    }
}

