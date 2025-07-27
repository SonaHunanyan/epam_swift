//
//  AppThemeStorage.swift
//  Storage1
//
//  Created by Sona Hunanyan on 28.07.25.
//

import Foundation

class AppThemeStorage {
    static let instance = AppThemeStorage()
    
     func getTheme() -> AppTheme {
        let rawValue = UserDefaults.standard.integer(forKey: StoreKeys.theme)
        return AppTheme(rawValue: rawValue) ?? .light
    }

     func saveTheme(_ theme: AppTheme) {
        UserDefaults.standard.set(theme.rawValue, forKey: StoreKeys.theme)
    }

}
