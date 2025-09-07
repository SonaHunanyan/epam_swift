//
//  ContentView.swift
//  EpamFinal
//
//  Created by Sona Hunanyan on 07.09.25.
//

import SwiftUI


struct HomeView: View {
    var body: some View {
        NavigationStack {    TabView {
            CitiesView()
                .tabItem {
                    Label("Cities", systemImage: AppIcons.globeIcon)
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: AppIcons.profileIcon)
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: AppIcons.favorites)
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

#Preview {
    HomeView()
}
