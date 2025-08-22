//
//  ContentView.swift
//  LayoutControlsFunctionBuilders6
//
//  Created by Sona Hunanyan on 22.08.25.
//

import SwiftUI

struct Grocery: Identifiable {
    let id = UUID()
    var name: String
    var enabled = false
}

struct ContentView: View {
    @State private var groceries = [Grocery(name:"Milk"),Grocery(name:"Egg"),Grocery(name: "Bread"), Grocery(name:"Fruits"), Grocery(name: "Salt") ]
    
    var body: some View {
        VStack {
            List {
                ForEach($groceries) { $item in
                    Toggle(item.name, isOn: $item.enabled)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
