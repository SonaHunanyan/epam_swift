import Combine
import Foundation


let namePublisher = Just("name").map {
    $0.uppercased()
}

let surnamePublisher = Just("surname")

Publishers.CombineLatest(namePublisher, surnamePublisher).map {
    "\($0) \($1)"
}.sink {
    print($0)
}

RunLoop.main.run()

