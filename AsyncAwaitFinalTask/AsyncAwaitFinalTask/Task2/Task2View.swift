//
//  Task2View.swift
//  AsyncAwaitFinalTask
//
//  Created by Nikolay Dechko on 4/9/24.
//

import SwiftUI

struct Task2View: View {
    let task2API: Task2API = .init()
    
    @State var user: Task2API.User?
    @State var products: [Task2API.Product] = []
    @State var duration: TimeInterval?
    
    enum FetchResult {
        case user(Task2API.User)
        case products([Task2API.Product])
    }
    
    var body: some View {
        VStack {
            if let user, !products.isEmpty, let duration {
                Text("User name: \(user.name)").padding()
                List(products) { product in
                    Text("product description: \(product.description)")
                }
                Text("it took: \(duration) second(s)")
            } else {
                Text("Loading in progress")
            }
        }.task {
                let startDate = Date.now
                await withThrowingTaskGroup(of: FetchResult.self) { taskGroup in
                    taskGroup.addTask {
                        let result = try await task2API.getUser()
                        return .user(result)
                    }
                    taskGroup.addTask {
                        let result = try await task2API.getProducts()
                        return .products(result)
                    }
                    
                    do {
                        for try await value in taskGroup {
                            switch value {
                            case .user(let value):
                                self.user = value
                            case .products(let value):
                                self.products = value
                            }
                        }
                    } catch {
                        print(error)
                    }
                }
                let endDate = Date.now
                duration = DateInterval(start: startDate, end: endDate).duration
            }
        }
}

class Task2API: @unchecked Sendable {
    struct User {
        let name: String
    }
    
    struct Product: Identifiable {
        let id: String
        let description: String
    }
    
    func getUser() async throws -> User {
        try await Task.sleep(for: .seconds(1))
        return .init(name: "John Smith")
    }
    
    func getProducts() async throws -> [Product] {
        try await Task.sleep(for: .seconds(1))
        return [.init(id: "1", description: "Some cool product"),
                .init(id: "2", description: "Some expensive product")]
    }
}

#Preview {
    Task2View()
}
