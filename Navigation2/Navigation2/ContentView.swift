//
//  ContentView.swift
//  Navigation2
//
//  Created by Sona Hunanyan on 24.08.25.
//

import SwiftUI

enum AppRoute: Hashable {
    case home
    case settings
    case profile
}

struct ContentView: View {
    @State private var path: [AppRoute] = []

    var body: some View {
        NavigationStack(path: $path) {
            HomeView(path: $path).navigationDestination(for: AppRoute.self, destination: {route in
                switch route {
                case .home:
                    HomeView(path: $path)
                case .profile:
                    ProfileView(path: $path)
                case .settings:
                    SettingsView(path: $path)
                    
                }
            })
        }
        .padding()
    }
}

struct HomeView: View {
    @Binding var path: [AppRoute]

    var body: some View {
        VStack(spacing: 20) {
            Text("Home")
                .font(.largeTitle)

            Button("Go to Settings") {
                path.append(.settings)
            }
        }
    }
}

struct SettingsView: View {
    @Binding var path: [AppRoute]

    var body: some View {
        VStack(spacing: 20) {
            Text("Settings View")
                .font(.largeTitle)

            Button("Go to Profile") {
                path.append(.profile)
            }
        }
    }
}

struct ProfileView: View {
    @Binding var path: [AppRoute]

    var body: some View {
        VStack(spacing: 20) {
            Text("Profile View")
                .font(.largeTitle)

            Button("Go to Home") {
                path = []
            }
        }
    }
}

#Preview {
    ContentView()
}
