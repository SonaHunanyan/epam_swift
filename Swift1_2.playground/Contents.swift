func isBalancedParentheses(input: String) -> Bool {
    let filtered = input.filter({ $0 == "(" || $0 == ")" })
    
    var count = 0
    
    for i in filtered {
        if i == ")" {
            count = count - 1
        }
        else if i == "("
        {
            count = count + 1
        }
        if count < 0 {
            return false
        }
    }
    
    return count == 0
}

