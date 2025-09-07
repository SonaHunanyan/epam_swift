//
//  LanguageModalView.swift
//  EpamFinal
//
//  Created by Sona Hunanyan on 07.09.25.
//

import SwiftUICore
import SwiftUI

struct LanguageModalView: View {
    @ObservedObject var languageManager: LanguageManager
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            List {
                ForEach(AppLanguage.allCases) { lang in
                    HStack {
                        Text("\(lang.title) \(lang.flag)")
                        Spacer()
                        if lang.rawValue == languageManager.appLanguage {
                            Image(systemName: AppIcons.checkMark)
                        }
                    }.onTapGesture {
                        languageManager.appLanguage = lang.rawValue
                        dismiss()
                    }
                    
                }
            }
        }
    }
}


