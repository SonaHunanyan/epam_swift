import Combine
import Foundation


let subject = PassthroughSubject<String, Never>()

subject
    .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
    .sink { print($0) }

subject.send("H")

DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
    subject.send("He")
}

DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
    subject.send("Hel")
}

DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
    subject.send("Hello")
}

RunLoop.main.run()
