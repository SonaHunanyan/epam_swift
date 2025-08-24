//
//  ContentView.swift
//  StateManagement3
//
//  Created by Sona Hunanyan on 24.08.25.
//

import SwiftUI

struct ContentView: View {
    @State private var isOn: Bool = false
    var body: some View {
        VStack {
            Text("Value \(isOn)")
            PrimaryToggle(isOn: $isOn)
        }
        .padding()
    }
}

struct PrimaryToggle: View {
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle("Value", isOn: $isOn)
    }
}

#Preview {
    ContentView()
}
