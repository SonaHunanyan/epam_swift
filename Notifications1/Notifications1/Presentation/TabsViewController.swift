//
//  TabsViewController.swift
//  Notifications1
//
//  Created by Sona Hunanyan on 27.07.25.
//
import UIKit

class TabsViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        let mainVC = MainViewController()
        mainVC.tabBarItem = UITabBarItem(title: "Sender", image: UIImage(systemName: "paperplane"), tag: 0)
        let receiverVC = ReceiverViewController()
        receiverVC.tabBarItem = UITabBarItem(title: "Receiver", image: UIImage(systemName: "bell"), tag: 1)
        viewControllers = [mainVC, receiverVC]
    }
    
}
