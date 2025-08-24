//
//  ContentView.swift
//  StateManagement5
//
//  Created by Sona Hunanyan on 24.08.25.
//

import SwiftUI

@Observable
class FormModel {
    
    init(username: String) {
        self.username = username
    }
    
    var username: String
}

struct ContentView: View {
    @State private var form = FormModel(username: "")
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter username", text: $form.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Submit") {
                print("Submited")
            }
            .buttonStyle(.borderedProminent)
            .disabled(form.username.isEmpty)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
