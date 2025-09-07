//
//  AppLanguage.swift
//  EpamFinal
//
//  Created by Sona Hunanyan on 07.09.25.
//

enum AppLanguage: String, CaseIterable,Identifiable {
    case english = "en"
    case russian = "ru"
    
    var id: String {
        rawValue
    }
    
    var title: String {
        switch self {
        case .english:
            return "English"
        case .russian:
            return "Русский"
        }
    }
    
    var flag: String {
            switch self {
            case .english: return "🇬🇧"
            case .russian: return "🇷🇺"
            }
        }
}
