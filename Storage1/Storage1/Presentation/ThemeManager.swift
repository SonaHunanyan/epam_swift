//
//  ThemeManager.swift
//  Storage1
//
//  Created by Sona Hunanyan on 28.07.25.
//

import UIKit

class ThemeManager {
    static func applyTheme(_ theme: AppTheme) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.overrideUserInterfaceStyle = theme.interfaceStyle
        }
    }
}
