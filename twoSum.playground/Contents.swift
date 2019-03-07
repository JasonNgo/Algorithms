// Two Number Sum
// Write a function that takes a non-empty array of distinct integers
// and an integer representing a target sum. If any pair of numbers
// sum up to the target sum, the function should return them in
// sorted order, otherwise return an empty array

import Cocoa

// Solution 1:
// Iterate through each value, for each value check every value
// afterwards to see if any combination of the two sum up to the
// target value

func twoSumSolution1(_ array: [Int], targetSum: Int) -> [Int] {
    for i in 0..<array.count - 1 {
        for j in i+1..<array.count {
            let ithValue = array[i]
            let jthValue = array[j]
            
            if ithValue + jthValue == targetSum {
                return ithValue > jthValue ? [jthValue, ithValue] : [ithValue, jthValue]
            }
        }
    }
    
    return []
}

// Solution 2:
// Sort the values initially. Than use two pointers each pointing to
// the ends of the input array. Sum the two pointer values. If the
// sum is less than the target value increment the left pointer
// otherwise decrement the right pointer

func twoSumSolution2(_ array: [Int], targetSum: Int) -> [Int] {
    let sortedArray = array.sorted()
    var left = 0
    var right = array.count - 1
    
    while left < right {
        let leftValue = sortedArray[left]
        let rightValue = sortedArray[right]
        
        if leftValue + rightValue == targetSum {
            return [leftValue, rightValue]
        } else if leftValue + rightValue > targetSum {
            right -= 1
        } else if leftValue + rightValue < targetSum {
            left += 1
        }
    }
    
    return []
}

func twoSumSolution3(_ array: [Int], targetSum: Int) -> [Int] {
    var hashTable = Set<Int>()
    
    for num in array {
        let complement = targetSum - num
        if hashTable.contains(complement) {
            if complement > num {
                return [num, complement]
            } else {
                return [complement, num]
            }
        } else {
            hashTable.insert(num)
        }
    }

    return []
}

twoSumSolution2([3,5,-4,8,11,1,-1,6], targetSum: 10)
