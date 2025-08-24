//
//  ContentView.swift
//  Navigation1
//
//  Created by Sona Hunanyan on 24.08.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Text("Welcome").font(.title)
            
            NavigationLink("Go to Next View"){
                SecondView()
            }.buttonStyle(.borderedProminent)
            
        }
    
    }
}

struct SecondView: View {
    var body: some View {
        Text("Hello, SwiftUI Navigation!").font(.title)
    }
}

#Preview {
    ContentView()
}
