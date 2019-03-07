// CTCI - isUnique
// Determine if a string only has unique characters.
// What if we can't use other data structures?

// Algorithm
// 1. Iterate through the input string, inserting values into a hash table
// 2. If a collison occurs than return false as this indicates a duplicate value
// 3. If no collisons occur when we reach the end of the input string return true

import Cocoa

func isUnique(_ input: String) -> Bool {
    guard input.count > 1 else { return true }
    
    var hashTable = Set<Character>()
    for char in input {
        guard !hashTable.contains(char) else {
            return false
        }
        
        hashTable.insert(char)
    }
    
    return true
}

func isUnique2(_ input: String) -> Bool {
    return Set(input).count == input.count
}

func isUnique3(_ input: String) -> Bool {
    guard input.count > 1 else { return true }
    
    let count = 256 // Assuming ASCII values only
    var characterArray = Array(repeating: 0, count: count)
    
    for scalar in input.unicodeScalars {
        let index = Int(scalar.value)
        let count = characterArray[index]
        
        if count == 0 {
            characterArray[index] = count + 1
        } else {
            return false
        }
    }
    
    return true
}

assert(isUnique3("") == true)
assert(isUnique3("a") == true)
assert(isUnique3("abc") == true)
assert(isUnique3("aAbBcC") == true)
assert(isUnique3("aAa") == false)
print("tests complete")
