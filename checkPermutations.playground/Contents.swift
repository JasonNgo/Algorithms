// Check Permutations - Check if two strings are permutations of each other

// Algorithm:
// 1. Iterate through the first string, keeping track of the counts of each character
// 2. Iterate through the other string, decreasing counts of each character
// 3. If we encounter a character that doesn't exist in the counts tracker or the count
// of a character goes below 0, return false

import Cocoa

func checkPermutation(_ input1: String, _ input2: String) -> Bool {
    guard input1.count == input2.count else {
        return false
    }
    
    var counts = [Character: Int]()
    for char in input1 {
        if let count = counts[char] {
            counts[char] = count + 1
        } else {
            counts[char] = 1
        }
    }
    
    for char in input2 {
        guard let count = counts[char] else {
            return false
        }
        
        if count - 1 < 0 {
            return false
        }
        
        counts[char] = count - 1
    }
    
    return true
}

checkPermutation("abc", "bca")
checkPermutation("abc", "hgb")
checkPermutation("abc", "ABC")
