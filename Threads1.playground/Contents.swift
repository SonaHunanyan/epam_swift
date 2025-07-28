import Foundation

class Counter: @unchecked Sendable {
    private let lock = NSLock()
    var value = 0
    
    func increment() {
        lock.lock()
        self.value += 1
        lock.unlock()
    }
}

func runCounterTask() {
    let counter = Counter()
    
    let thread1 = Thread {
        for _ in 1...1000 {
            counter.increment()
        }
    }
    
    let thread2 = Thread {
        for _ in 1...1000 {
            counter.increment()
        }
    }
    thread1.start()
    thread2.start()
    
    while thread1.isExecuting || thread2.isExecuting {
        usleep(100)
    }
    let value = counter.value
    if value != 2000 {
        print("Final counter value: \(value) (Expected: 2000, but will likely be incorrect)")
    }
    else {
        print("Final counter value: \(value)")
    }
}

runCounterTask()
