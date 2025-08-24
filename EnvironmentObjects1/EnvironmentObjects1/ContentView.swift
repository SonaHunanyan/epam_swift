//
//  ContentView.swift
//  EnvironmentObjects1
//
//  Created by Sona Hunanyan on 24.08.25.
//

import SwiftUI

class Counter: ObservableObject {
    @Published var counterValue: Int = 0
}

struct RootView: View {
    @StateObject private var counter = Counter()
    
    var body: some View {
        VStack(spacing: 20) {
            CounterDisplayView()
            IncrementCounterView()
            DecrementCounterView()
        }
        .environmentObject(counter)
        .padding()
    }
}

struct CounterDisplayView: View {
    @EnvironmentObject var counter: Counter
    
    var body: some View {
        Text("Counter \(counter.counterValue)")
            .font(.title)
    }
}

struct IncrementCounterView: View {
    @EnvironmentObject var counter: Counter
    
    var body: some View {
        Button("+1")
        {
            counter.counterValue += 1
        }.buttonStyle(.borderedProminent)
    }
}

struct DecrementCounterView: View {
    @EnvironmentObject var counter: Counter
    
    var body: some View {
        Button("-1") {
            counter.counterValue -= 1
        }.buttonStyle(.borderedProminent)
    }
}

#Preview {
    RootView()
}
