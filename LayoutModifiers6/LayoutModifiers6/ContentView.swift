//
//  ContentView.swift
//  LayoutModifiers6
//
//  Created by Sona Hunanyan on 24.08.25.
//

import SwiftUI

struct ContentView: View {
    @State private var isEnabled = true

    var body: some View {
        VStack {
            Button("Modify"){
                if(isEnabled){
                     print("Hello")
                }
                return
            }
            .applyStyle(isEnbaled: isEnabled)
            
            Toggle("Enable", isOn: $isEnabled)
                           
         
        }
        .padding()
    }
}

struct PrimaryButtonModifier: ViewModifier {
      var font: Font
      var backgriundColor: Color
      var cornerRadius: CGFloat
    
    func body(content: Content)-> some View {
        return content
            .font(font)
            .padding(.horizontal, 16)
            .background(backgriundColor)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
    
}

extension View {
    func applyStyle(isEnbaled: Bool) -> some View {
         self.modifier(
           PrimaryButtonModifier(
            font: .body, backgriundColor: isEnbaled ?  Color.blue : Color.gray, cornerRadius: 6,
           )
        )
    }
}

#Preview {
    ContentView()
}
