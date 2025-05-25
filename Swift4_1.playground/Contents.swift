class Stack<T> {
    
    private var stack: [T] = []
    
    func push(_ element: T) {
        stack.append(element)
    }
    
    func pop() -> T? {
        if stack.isEmpty {
            return nil
        }
        let item = stack.last
        stack.removeLast()
        return item
    }
    
    func printStackContents() -> String {
        let stackText = stack.map( {"\($0)"} ).joined(separator: ", ")
        print(stackText)
        return stackText
    }
    
    func size() -> Int {
        return stack.count
    }
}

