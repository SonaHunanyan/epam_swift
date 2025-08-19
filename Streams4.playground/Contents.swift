import Combine
import Foundation

let subject = PassthroughSubject<Int, Never>()

subject.filter {
    $0 % 2 == 0
}.sink {
    print($0)
}


subject.send(1)
subject.send(2)
subject.send(3)
subject.send(4)
subject.send(5)

RunLoop.main.run()
