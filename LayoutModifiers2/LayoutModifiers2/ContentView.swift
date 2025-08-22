//
//  ContentView.swift
//  LayoutModifiers2
//
//  Created by Sona Hunanyan on 22.08.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack() {
            Rectangle()
                .fill(Color.red)
                .frame(width: 150, height: 100)
            Rectangle()
                .fill(Color.green)
                .frame(width: 150, height: 100)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        }
        .frame(
            width: .infinity,
            height: .infinity,
        )
    }
}

#Preview {
    ContentView()
}
