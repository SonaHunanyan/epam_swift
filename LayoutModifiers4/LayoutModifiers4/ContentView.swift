//
//  ContentView.swift
//  LayoutModifiers4
//
//  Created by Sona Hunanyan on 23.08.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Circle()
                .fill(.blue)
                .frame(width: 100, height: 100)
                .offset(x: -UIScreen.main.bounds.size.width/2+50, y: -UIScreen.main.bounds.size.height/2+150)
            
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 200)
                .offset(x:-UIScreen.main.bounds.size.width/2+100, y: -UIScreen.main.bounds.size.height/2+150)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
