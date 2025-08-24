//
//  ContentView.swift
//  EnvironmentObjects2
//
//  Created by Sona Hunanyan on 24.08.25.
//

import SwiftUI

class TaskManager: ObservableObject {
    @Published var tasks: [String] = []
}

struct ContentView: View {
    var body: some View {
        TabView {
            TaskListView()
                .tabItem {
                    Text("Tasks").font(.title)
                }
            AddTaskView()
                .tabItem {
                    Text("Add").font(.title)
                }
            RemoveTaskView()
                .tabItem {
                    Text("Remove").font(.title)
                }
        }
    }
}

struct TaskListView: View {
    @EnvironmentObject var taskManager: TaskManager
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Array(taskManager.tasks.enumerated()), id: \.offset) {task in
                    Text(task.element)
                }
            }
            .navigationTitle("Tasks")
        }.padding()
    }
}

struct AddTaskView: View {
    @EnvironmentObject var taskManager: TaskManager
    @State private var task: String = ""
    
    var body: some View {
        NavigationView {   VStack(spacing: 20) {
            TextField("Create new task", text: $task)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Add") {
                taskManager.tasks.append(task)
                task = ""
            }
            .buttonStyle(.borderedProminent)
            .disabled(task.isEmpty)
        }
        .padding()
        .navigationTitle("Add Task")
        }
    }
}

struct RemoveTaskView: View {
    @EnvironmentObject var taskManager: TaskManager
    @State private var indexToRemove: String = ""
    
    var body: some View {
        NavigationView {    List {
            ForEach(Array(taskManager.tasks.enumerated()), id: \.offset) {index,task in
                HStack {
                    Text(task).font(.headline)
                    Spacer()
                    Button("Remove") {
                        taskManager.tasks.remove(at: index)
                    }
                    
                }
            }
        }
        .navigationTitle("Remove Task")
        }
        .padding()
        
    }
}

#Preview {
    ContentView().environmentObject(TaskManager())
}
