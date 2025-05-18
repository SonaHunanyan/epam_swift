func isBalancedParentheses(input: String) -> Bool {
    let filtered = input.filter({ $0 == "(" || $0 == ")" })
    
    var openCount = 0
    var closeCount = 0
    
    for i in filtered {
        if i == ")" {
            closeCount = closeCount + 1
        }
        else if i == "("
        {
            openCount = openCount + 1
        }
    }
    
    return openCount == closeCount
}
