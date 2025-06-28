//
//  TabController.swift
//  Controllers
//
//  Created by Sona Hunanyan on 29.06.25.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        self.setupTabBar()
    }
    
    private func setupTabBar() {
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = .gray
        self.tabBar.backgroundColor = .orange
    }
    
    private func setupTabs(){
        let onboarding = self.renderNavBarItem(title: "Onboarding", image: UIImage(systemName: "questionmark.circle"), vc: OnboardingController())
        let profile = self.renderNavBarItem(title: "Profile", image: UIImage(systemName: "person.circle.fill"), vc: ProfileViewController())
        let settings = self.renderNavBarItem(title: "Settings", image: UIImage(systemName: "slider.horizontal.3"), vc: SettingsViewController())
        self.setViewControllers([onboarding, profile, settings], animated: true)
    }
    
    private func renderNavBarItem(title: String, image: UIImage?, vc: UIViewController) -> UINavigationController {
        let item = UINavigationController(rootViewController:  vc)
        item.tabBarItem.title = title
        item.tabBarItem.image = image
        return item
    }
    
}


