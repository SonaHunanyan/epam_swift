//
//  ViewController.swift
//  Notifications1
//
//  Created by Sona Hunanyan on 27.07.25.
//

import UIKit

class MainViewController: UIViewController {
    private let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .white
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Send Notification", for: .normal)
        button.backgroundColor = .systemPurple
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.contentEdgeInsets = UIEdgeInsets(
            top: 10, left: 10, bottom: 10, right: 10
        )
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        button.addTarget(self, action: #selector(onButtonTap), for: .touchUpInside)
    }
    
    
    @objc private func onButtonTap() {
        NotificationCenter.default.post(name: .simpleNotification, object: nil, userInfo: ["message": "Helloooooooo))))"])
    }
}


extension Notification.Name {
    static let simpleNotification = Notification.Name(AppConsts.simpleNotificationKey)
}
