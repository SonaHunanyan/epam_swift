//
//  ContentView.swift
//  StateManagement4
//
//  Created by Sona Hunanyan on 24.08.25.
//

import SwiftUI

@Observable
class Profile {
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
    var name: String
    var email: String
}

struct ContentView: View {
   @State private var profile = Profile(name: "", email: "")
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(profile.name)")
            TextField("Enter name", text: $profile.name)
                          .textFieldStyle(.roundedBorder)
            Text("Email: \(profile.email)")
            TextField("Enter email", text: $profile.email)
                          .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
