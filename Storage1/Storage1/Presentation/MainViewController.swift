//
//  ViewController.swift
//  Storage1
//
//  Created by Sona Hunanyan on 28.07.25.
//

import UIKit

class MainViewController: UIViewController {
    
    private let themeControl: UISegmentedControl = {
        let control = UISegmentedControl(items: [AppTheme.light.name(), AppTheme.dark.name()])
        control.selectedSegmentIndex = AppThemeStorage.instance.getTheme().rawValue
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let theme = AppThemeStorage.instance.getTheme()
        ThemeManager.applyTheme(theme)
        setup()
        themeControl.addTarget(self, action: #selector(themeChanged), for: .valueChanged)
    }
    
    private func setup() {
        view.backgroundColor = .systemBackground
        view.addSubview(themeControl)
        NSLayoutConstraint.activate([
            themeControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            themeControl.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            themeControl.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc private func themeChanged() {
        guard let selectedTheme = AppTheme(rawValue: themeControl.selectedSegmentIndex) else { return }
        AppThemeStorage.instance.saveTheme(selectedTheme)
        ThemeManager.applyTheme(selectedTheme)
    }
    
}

