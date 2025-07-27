//
//  ViewController.swift
//  Notifications3
//
//  Created by Sona Hunanyan on 27.07.25.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    private func setup() {
        view.backgroundColor = .white
        addListeners()
    }
    
    private func addListeners() {
        NotificationCenter.default.addObserver(self, selector: #selector(onEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(onEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    private func removeListeners() {
        NotificationCenter.default.removeObserver(self, name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc private func onEnterBackground(_ notification: Notification) {
        print("Application enter background")
    }
    
    @objc private func onEnterForeground(_ notification: Notification){
        print("Application returned foreground")
    }

    deinit {
        removeListeners()
    }
}

