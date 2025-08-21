//
//  ContentView.swift
//  LayoutControlsFunctionBuilders2
//
//  Created by Sona Hunanyan on 22.08.25.
//

import SwiftUI

struct ContentView: View {
    let names = ["Sona", "Karen", "Susanna", "Zoya", "Victor"]
    var body: some View {
        List(names, id: \.self){ name in
            HStack(spacing: 16) {
                Text(name).font(.system(
                    size: 15,
                    weight: .medium))
                .foregroundColor(.purple)
                
                Button("Tap") {
                    print(name)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
