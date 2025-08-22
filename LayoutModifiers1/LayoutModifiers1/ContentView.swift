//
//  ContentView.swift
//  LayoutModifiers1
//
//  Created by Sona Hunanyan on 22.08.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("SwiftUI Layout Modifiers").padding(16).background(Color.purple)
            
            Text("SwiftUI Layout Modifiers").padding(.top,16).background(Color.purple)
            
            Text("SwiftUI Layout Modifiers").padding(.bottom,16).background(Color.purple)
            
            Text("SwiftUI Layout Modifiers").padding(.leading,16).background(Color.purple)
            
            Text("SwiftUI Layout Modifiers").padding(.trailing,16).background(Color.purple)
            
            Text("SwiftUI Layout Modifiers").padding(.vertical,16).background(Color.purple)
            
            Text("SwiftUI Layout Modifiers").padding(.horizontal,16).background(Color.purple)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
