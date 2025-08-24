//
//  ContentView.swift
//  StateManagement7
//
//  Created by Sona Hunanyan on 24.08.25.
//

import SwiftUI

@Observable
class Counter {
    var value: Int = 0
}

struct ContentView: View {
    @State private var counter = Counter()
    
    var body: some View {
        TabView {
            FirstView()
                .tabItem { Text("First" ) }
            SecondView()
                .tabItem { Text("Second") }
        }.environment(counter)
    }
}

struct FirstView: View {
    @Environment(Counter.self) private var counter
    
    var body: some View {
        PrimaryView(title: "First counter \(counter.value)", onTap: {
            counter.value += 1
        })
    }
}

struct SecondView: View {
    @Environment(Counter.self) private var counter
    
    var body: some View {
        PrimaryView(title: "Second counter \(counter.value)", onTap: {
            counter.value += 1
        })
    }
}

struct PrimaryView: View {
    var title: String
    var onTap: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.title)
            Button("Increment") {
                onTap()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
