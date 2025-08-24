//
//  EnvironmentObjects2App.swift
//  EnvironmentObjects2
//
//  Created by Sona Hunanyan on 24.08.25.
//

import SwiftUI

@main
struct EnvironmentObjects2App: App {
    @StateObject private var taskManager = TaskManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(taskManager)
        }
    }
}
