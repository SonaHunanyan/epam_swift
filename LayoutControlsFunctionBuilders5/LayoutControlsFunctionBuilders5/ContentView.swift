//
//  ContentView.swift
//  LayoutControlsFunctionBuilders5
//
//  Created by Sona Hunanyan on 22.08.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            CardView(title: "Avatar", content:  Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.gray))
            CardView(title: "Name", content: Text("Sona Hunanyan").font(.headline))
            CardView(title: "Send message", content:  Button("Send"){
                print("Message sent")
            }).buttonStyle(.borderedProminent)
        }
        .padding()
    }
}


struct CardView<Content: View>: View {
    let title: String
    let content: Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Divider()
            Text(title)
                .font(.title)
            
            content
        }
    }
}

#Preview {
    ContentView()
}
