import Cocoa

public func longestPalindromeSubstring(input: String) -> String {
    guard input.count > 1 else {
        return input
    }
    
    let characters = Array(input)
    var currentLongestRange = [0, 1]
    
    for i in 1..<input.count {
        let oddRange = getLongestPalindromeFrom(input: characters, startIdx: i - 1, endIdx: i + 1)
        let evenRange = getLongestPalindromeFrom(input: characters, startIdx: i - 1, endIdx: i)
        
        let longest: [Int]
        if oddRange[1] - oddRange[0] > evenRange[1] - evenRange[0] {
            longest = [oddRange[0], oddRange[1]]
        } else {
            longest = [evenRange[0], evenRange[1]]
        }
        
        if longest[1] - longest[0] > currentLongestRange[1] - currentLongestRange[0] {
            currentLongestRange = longest
        }
    }
    
    return characters[currentLongestRange[0]..<currentLongestRange[1]].compactMap {String($0)}.joined()
}

public func getLongestPalindromeFrom(input: [Character], startIdx: Int, endIdx: Int) -> [Int] {
    var startIdx = startIdx
    var endIdx = endIdx
    
    while startIdx >= 0 && endIdx < input.count {
        if input[startIdx] != input[endIdx] {
            break
        }
        startIdx -= 1
        endIdx += 1
    }
    
    return [startIdx + 1, endIdx]
}

longestPalindromeSubstring(input: "abaxyzzyxf")
longestPalindromeSubstring(input: "a")
