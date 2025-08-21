//
//  ContentView.swift
//  LayoutControlsFunctionBuilders3
//
//  Created by Sona Hunanyan on 22.08.25.
//

import SwiftUI

struct User {
    let name: String
    let title: String
}

struct ContentView: View {
    let users = [
        User(name: "Sona", title: "Software Developer"),
        User(name: "Karen", title: "Software Developer"),
        User(name: "Susanna", title: "Risk Manager"),
    ]
    var body: some View {
        VStack(spacing: 16) {
            List(users, id: \.self.name) { user in
                ProfileItemView(user: user)
            }
        }
        .padding()
    }
}

struct ProfileItemView: View {
    let user: User
    var body: some View {
        HStack(spacing: 20) {
            ProfilePhotoView()
            ProfileDetailsView(user: user)
        }
    }
}

struct ProfilePhotoView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.purple)
                .frame(width: 70, height: 70)
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
        }
    }
}

struct ProfileDetailsView: View {
    let user: User
    var body: some View  {
        VStack(alignment: .leading, spacing: 16) {
            Text(user.name).font(.system(size: 16,
                                         weight: .bold
                                        )).foregroundColor(.black)
            Text(user.title).font(.system(size: 16,
                                          weight: .medium
                                        )).foregroundColor(.black)
            
        }
    }
}

#Preview {
    ContentView()
}

