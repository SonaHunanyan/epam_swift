//
//  ContentView.swift
//  StateManagement2
//
//  Created by Sona Hunanyan on 24.08.25.
//

import SwiftUI

struct ContentView: View {
    @State private var isOn = false
    var body: some View {
        VStack(spacing: 20) {
            Toggle("Display", isOn: $isOn)
            if isOn {
                Text("Hello, SwiftUI!")
                    .font(.title)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
