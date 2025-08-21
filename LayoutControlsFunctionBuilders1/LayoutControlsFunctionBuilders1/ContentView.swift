//
//  ContentView.swift
//  LayoutControlsFunctionBuilders1
//
//  Created by Sona Hunanyan on 22.08.25.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowGreetingDisplayed = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Toggle("Show Greeting", isOn: $isShowGreetingDisplayed)
            
            if isShowGreetingDisplayed {
                Text("Hello, SwiftUI!")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.purple)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
