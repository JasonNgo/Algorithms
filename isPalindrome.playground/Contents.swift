/* isPalindrome
 *
 * Write a function that takes in a non-empty string and returns a bool representing
 * whether or not the string is a palindrome. A palindrome is a string that is written the
 * same forward and backward
 */

import Cocoa

func isPalindrome(string: String) -> Bool {
    var left = string.startIndex
    var right = string.index(before: string.endIndex)
    
    while left < right {
        guard string[left] == string[right] else {
            return false
        }
        
        left = string.index(after: left)
        right = string.index(before: right)
    }
    
    return true
}

let string1 = "abcba"
let expected1 = true
assert(isPalindrome(string: string1) == expected1)

let string2 = "abba"
let expected2 = true
assert(isPalindrome(string: string2) == expected2)

let string3 = "aAbB"
let expected3 = false
assert(isPalindrome(string: string3) == expected3)
