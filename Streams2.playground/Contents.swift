import Combine
import Foundation


Future<String, Never>() { promise in
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            promise(.success("Hello, Combine!"))
        }
    }
.sink{ value in
print(value)
}


RunLoop.main.run()
