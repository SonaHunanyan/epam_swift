//
//  ContentView.swift
//  StateManagement6
//
//  Created by Sona Hunanyan on 24.08.25.
//

import SwiftUI

struct SettingItem: Identifiable {
    let id = UUID()
    let name: String
    var enabled: Bool
}

struct ContentView: View {
    @State private var settings = [
        SettingItem(name: "Item 1", enabled: false),
        SettingItem(name: "Item 2", enabled: false),
        SettingItem(name: "Item 3", enabled: false)
    ]
    var body: some View {
        List {
            ForEach($settings) { $item in
                Toggle(item.name, isOn: $item.enabled)
            }
        }
    }
}

#Preview {
    ContentView()
}
