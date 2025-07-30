//
//  Task4View.swift
//  AsyncAwaitFinalTask
//
//  Created by Nikolay Dechko on 08/07/2024.
//
import SwiftUI

struct Task4View: View {
    var api = Task4ViewAPI()
    @State var finished: Bool = false
    @State var ballance: Int = 1000
    
    var body: some View {
        VStack {
            Text("Starting ballance: 1000")
            if finished {
                Text("Final balance: \(ballance)")
                Text(ballance == 0 ? "Success" : "Failure")
            }
            Button {
                Task {
                    if finished {
                        await api.reset()
                        finished = false
                    } else {
                        ballance = await api.startUpdate()
                        self.finished = true
                    }
                }
            } label: {
                if finished {
                    Text("Reset")
                } else {
                    Text("Start")
                }
            }
        }
    }
}

#Preview {
    Task4View()
}



actor BalanceActor {
    private var balance: Int = 1000
    
    func get() -> Int {
        return balance
    }
    
    func decrease() {
        balance -= 1
    }
    
    func reset() {
        balance = 1000
    }
}

class Task4ViewAPI: @unchecked Sendable {
    private let actor = BalanceActor()
    
    func startUpdate() async -> Int {
        await withTaskGroup(of: Void.self) { group in
            for _ in 0...999 {
                group.addTask { [weak self] in
                    await self?.actor.decrease()
                }
            }
        }
        
        return await actor.get()
    }
    
    func reset() async {
        await actor.reset()
    }
}
