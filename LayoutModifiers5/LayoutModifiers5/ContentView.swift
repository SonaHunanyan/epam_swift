//
//  ContentView.swift
//  LayoutModifiers5
//
//  Created by Sona Hunanyan on 23.08.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
       
            Text("SwiftUI is amazing!")
                .padding(16)
                .background(.gray)
                .overlay(
                    Circle()
                        .fill(
                            .white.opacity(0.3)
                        )
                )
                .clipShape(
                    Circle()
                )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
