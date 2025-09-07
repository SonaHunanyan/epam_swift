//
//  LanguageButton.swift
//  EpamFinal
//
//  Created by Sona Hunanyan on 07.09.25.
//

import SwiftUICore
import SwiftUI

struct LanguageButton: View {
    @EnvironmentObject var languageManager: LanguageManager
    @State private var showingLanguageModal = false
    
    var body: some View {
        HStack(spacing: 5) {
            Text("\(languageManager.selectedLanguage.flag) \(languageManager.selectedLanguage.title)")
            Image(systemName: AppIcons.chevronDown)
        }
        .onTapGesture {
            showingLanguageModal.toggle()
        }
        .environment(\.locale, .init(identifier: languageManager.appLanguage))
        .sheet(isPresented: $showingLanguageModal) {
            LanguageModalView(languageManager: languageManager)
        }
    }
}
