//
//  ContentView.swift
//  LayoutModifiers3
//
//  Created by Sona Hunanyan on 23.08.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(alignment: .top,spacing: 50, ) {
            Text("Item 1")
            Text("Item 2")
            Text("Item 3")
           
        }
        .padding(16)
    }
}

#Preview {
    ContentView()
}
