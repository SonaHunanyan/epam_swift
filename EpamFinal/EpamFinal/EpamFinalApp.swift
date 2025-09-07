//
//  EpamFinalApp.swift
//  EpamFinal
//
//  Created by Sona Hunanyan on 07.09.25.
//

import SwiftUI

@main
struct EpamFinalApp: App {
    
    @StateObject var languageManager = LanguageManager()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(languageManager)
                .environment(\.locale, .init(identifier: languageManager.appLanguage))
        }
    }
}
