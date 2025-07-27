//
//  AppTheme.swift
//  Storage1
//
//  Created by Sona Hunanyan on 28.07.25.
//

import UIKit


enum AppTheme: Int {
    case light = 0
    case dark = 1

    var interfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .light: return .light
        case .dark: return .dark
        }
    }
    
    func name() -> String {
        switch(self) {
        case .light:
            return "Light"
        case .dark:
            return "Dark"
        }
    }
}
