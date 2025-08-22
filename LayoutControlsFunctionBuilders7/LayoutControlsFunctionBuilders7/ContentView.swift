//
//  ContentView.swift
//  LayoutControlsFunctionBuilders7
//
//  Created by Sona Hunanyan on 22.08.25.
//

import SwiftUI

struct User {
    var name: String
    var age: Int
    var isPremium: Bool
}

struct ContentView: View {
    @State var user = User(name: "Sona", age: 25, isPremium: true)
    var body: some View {
        VStack(alignment: .center) {
            Text("Profile Details").font(.title)
            HStack(alignment: .top, ) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
                VStack(alignment: .leading, spacing: 10) {
                    Text(user.name).font(.title)
                    Text("\(user.age)").font(.title)
                }
                if user.isPremium {
                    Text("Premium")
                        .font(.title3)
                        .padding(.vertical, 3)
                        .padding(.horizontal, 10)
                        .background(Color.yellow.opacity(0.9))
                        .cornerRadius(10)
                        .padding(.leading, 5).padding(.top, 2)
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}


#Preview {
    ContentView()
}
