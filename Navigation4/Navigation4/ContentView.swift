//
//  ContentView.swift
//  Navigation4
//
//  Created by Sona Hunanyan on 24.08.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Text("Home")
                    .font(.title)
            }
            .navigationTitle("My App")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.purple, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView()) {
                        Text("Settings").font(.body)
                            .foregroundColor(.white)
                    }
                }
            }
            
        }
        
        .padding()
    }
}

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Settings")
                .font(.title)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    ContentView()
}
