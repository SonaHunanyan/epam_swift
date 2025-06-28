//
//  EditProfileViewController.swift
//  Controllers
//
//  Created by Sona Hunanyan on 30.06.25.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    private let infoLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit profile"
        view.backgroundColor = .white
        print("EditProfileViewController viewDidLoad")
        render()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("EditProfileViewController viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("EditProfileViewController viewDidAppear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("EditProfileViewController viewWillLayoutSubviews")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("EditProfileViewController viewDidLayoutSubviews")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("EditProfileViewController viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("EditProfileViewController viewDidDisappear")
    }
    
    private func render() {
        view.addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.text = "Edit Profile"
        infoLabel.font = .systemFont(ofSize: 20, weight: .medium)
        infoLabel.textColor = .systemBlue
        NSLayoutConstraint.activate([
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

