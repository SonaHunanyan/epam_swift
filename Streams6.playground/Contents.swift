import Combine
import Foundation


let subject = PassthroughSubject<Int, Never>()

subject.flatMap { value in
    Just(value * value)
}.sink { value in
    print(value)
}

subject.send(2)
subject.send(3)
subject.send(4)


RunLoop.main.run()
