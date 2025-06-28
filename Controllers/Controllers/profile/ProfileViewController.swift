//
//  ProfileController.swift
//  Controllers
//
//  Created by Sona Hunanyan on 29.06.25.
//

import UIKit

class ProfileViewController: UIViewController {

    private let nameLabel = UILabel()
    private let editButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ProfileController viewDidLoad")
        view.backgroundColor = .white
        render()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ProfileController viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ProfileController viewDidAppear")
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("ProfileController viewWillLayoutSubviews")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("ProfileController viewDidLayoutSubviews")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ProfileController viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ProfileController viewDidDisappear")
    }

    private func render() {
        title = "Profile"
        navigationItem.rightBarButtonItems = [UIBarButtonItem(
            image: UIImage(systemName: "person.crop.circle.fill"),
            style: .plain,
            target: self,
            action: #selector(setAnonymous)
        ), UIBarButtonItem(
            image: UIImage(systemName: "pencil.slash"),
            style: .plain,
            target: self,
            action: #selector(showAlert)
        )]
        nameLabel.text = "Default"
        nameLabel.textAlignment = .center
        nameLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        editButton.setTitle("Edit profile", for: .normal)
        editButton.setTitleColor(.white, for: .normal)
        editButton.backgroundColor = .systemBlue
        editButton.layer.cornerRadius = 10
        var config = UIButton.Configuration.filled()
        editButton.configuration = config
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        editButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        editButton.addTarget(self, action: #selector(openEditScreen), for: .touchUpInside)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editButton)

        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            editButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            editButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func showAlert() {
        let alert = UIAlertController(title: "Enter name", message: nil, preferredStyle: .alert)
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            let newName = alert.textFields?.first?.text ?? ""
            self?.nameLabel.text = newName.isEmpty ? "Default" : newName
        })
        present(alert, animated: true)
    }

    @objc private func setAnonymous() {
        nameLabel.text = "Anonymous"
    }

    @objc private func openEditScreen() {
        let controller = EditProfileViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
