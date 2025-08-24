//
//  ContentView.swift
//  Navigation3
//
//  Created by Sona Hunanyan on 24.08.25.
//

import SwiftUI

struct ContentView: View {
    let fruits = ["Apple", "Banana", "Cherry"]

    var body: some View {
        NavigationStack {
            List(fruits,id: \.self) { fruit in
                NavigationLink(value: fruit){
                    Text(fruit).font(.title)
                }
                
            }.navigationTitle("Fruits")
                .navigationDestination(for: String.self, destination: { fruit in
                    FruitDetailView(fruitName: fruit)
                })
        }
        .padding()
    }
}


struct FruitDetailView: View {
    let fruitName: String
    @State private var showMoreOpened = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Details about \(fruitName)")
                .font(.title)
            Button("More") {
                showMoreOpened = true
            }
            .buttonStyle(.borderedProminent)
        }
        .sheet(isPresented: $showMoreOpened) {
            MoreInfoSheet(fruitName: fruitName)
        }
    }
}

struct MoreInfoSheet: View {
    let fruitName: String

    var body: some View {
        VStack(spacing: 20) {
            Text("\(fruitName) details")
                .font(.body)
        }
        .padding()
    }

}

#Preview {
    ContentView()
}
