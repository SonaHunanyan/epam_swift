//
//  ContentView.swift
//  EpamFinal
//
//  Created by Sona Hunanyan on 07.09.25.
//

import SwiftUI


struct HomeView: View {
    
    init() {
          let appearance = UITabBarAppearance()
          appearance.configureWithOpaqueBackground()

          appearance.stackedLayoutAppearance.normal.iconColor = UIColor(Color(AppColors.grey))
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(Color(AppColors.grey))]

        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(Color(AppColors.primary))
          appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(Color(AppColors.primary))]
        
          UITabBar.appearance().standardAppearance = appearance
          UITabBar.appearance().scrollEdgeAppearance = appearance
      }
    
    
    var body: some View {
        NavigationStack {
            TabView {
                ForEach(NavBarItems.allCases, id: \.self) { item in
                    item.view
                        .tabItem {
                            Label(LocalizedStringKey(item.title), systemImage: item.icon)
                            
                        }
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    LanguageButton()
                }
            }
        }
        
    }
}

extension NavBarItems {
    var title: String {
        switch self {
        case .cities:
            AppStrings.cities
        case .favorites:
            AppStrings.favorites
        case .profile:
            AppStrings.profile
        }
    }
    
    var icon: String {
        switch self {
        case .cities:
            AppIcons.globeIcon
        case .favorites:
            AppIcons.favorites
        case .profile:
            AppIcons.profileIcon
        }
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .cities:
            CitiesView()
        case .favorites:
            FavoritesView()
        case .profile:
            ProfileView()
        }
    }
}


#Preview {
    @Previewable @StateObject var languageManager = LanguageManager()

    HomeView()
        .environmentObject(languageManager)
        .environment(\.locale, .init(identifier: languageManager.appLanguage))
}
