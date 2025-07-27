//
//  ReceiverViewController.swift
//  Notifications1
//
//  Created by Sona Hunanyan on 27.07.25.
//

import UIKit

class ReceiverViewController: UIViewController {
    private let notificationLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .white
        view.addSubview(notificationLabel)
        notificationLabel.font = .systemFont(ofSize: 24 , weight: .bold)
        notificationLabel.textColor = .systemPurple
        notificationLabel.text = "Say something...?"
        notificationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            notificationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            notificationLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        NotificationCenter.default.addObserver(self, selector: #selector(onReceiveNotification), name: .simpleNotification, object: nil)
    }
    
    @objc private func onReceiveNotification(_ notification: Notification) {
        if let message = notification.userInfo?["message"] as? String {
            notificationLabel.text = message
        }
    }
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
}
