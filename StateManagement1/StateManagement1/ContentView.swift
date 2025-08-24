//
//  ContentView.swift
//  StateManagement1
//
//  Created by Sona Hunanyan on 24.08.25.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    
    var body: some View {
        VStack {
            Text("Counter \(counter)")
                .font(.largeTitle)
                .bold()
            
            Button("+1") {
                counter += 1
            }
            .font(.title)
            .buttonStyle(.borderedProminent)
            .padding(20)
            .foregroundColor(.white)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
