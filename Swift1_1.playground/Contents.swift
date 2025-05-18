func isPalindrome(input: String) -> Bool {
    let filtered = input.lowercased().filter ({ $0.isLetter })
    
    if filtered.isEmpty { return false }
    
    for i in 0...filtered.count/2{
        let leftChar = filtered[filtered.index(filtered.startIndex, offsetBy: i)]
        let rightChar = filtered[filtered.index(filtered.startIndex, offsetBy: filtered.count-1-i)]
        if leftChar != rightChar { return false }
    }
    
    return true
}
