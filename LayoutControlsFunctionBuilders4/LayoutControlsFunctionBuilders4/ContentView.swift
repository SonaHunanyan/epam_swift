//
//  ContentView.swift
//  LayoutControlsFunctionBuilders4
//
//  Created by Sona Hunanyan on 22.08.25.
//

import SwiftUI

struct ContentView: View {
    @State var isDarkTheme = false
    var body: some View {
        ZStack {
            (isDarkTheme ? Color.gray : Color.white)
                .ignoresSafeArea()
            
           Toggle("Dark Theme", isOn: $isDarkTheme)
                .toggleStyle(ThemeToggleStyle())
        }
        .padding()
    }
}

struct ThemeToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 16) {
            configuration.label
            RoundedRectangle(cornerRadius: 30)
                .fill( configuration.isOn ? Color.purple : Color.yellow
                ).overlay {
                    Circle().fill(.white).padding(5).offset(
                        x: configuration.isOn ? -12 : 12
                    )
                }
                
                .frame(width: 70, height: 35).onTapGesture {
                    withAnimation(.spring()){
                        configuration.isOn.toggle()
                    }
                }
        }
    }
    
    
}

#Preview {
    ContentView()
}
