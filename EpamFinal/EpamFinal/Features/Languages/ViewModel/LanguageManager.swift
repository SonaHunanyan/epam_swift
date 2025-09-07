//
//  LanguageManager.swift
//  EpamFinal
//
//  Created by Sona Hunanyan on 07.09.25.
//

import Foundation
import SwiftUI

class LanguageManager: ObservableObject {
    @AppStorage(StoreKeys.language) var appLanguage: String =  AppLanguage.english.rawValue {
        didSet {
            objectWillChange.send()
        }
    }
    
    var selectedLanguage: AppLanguage {
        for item in AppLanguage.allCases {
            if item.rawValue == appLanguage {
                return item
            }
        }
        return AppLanguage.english
    }
}
