/* Problem: Given two unempty arrays, deteremine the smallest difference using a number from the first array and a
 * number from the second array that is closest to zero. Return the two numbers that return the smallest difference as
 * an array
 */

import Cocoa

public func smallestDifference(arrayOne: [Int], arrayTwo: [Int]) -> [Int] {
    let sortedOne = arrayOne.sorted()
    let sortedTwo = arrayTwo.sorted()
    var idxOne = 0
    var idxTwo = 0
    var smallest = Int.max
    var current = Int.max
    var result: [Int] = []
    
    while idxOne < arrayOne.count && idxTwo < arrayTwo.count {
        let firstNum = sortedOne[idxOne]
        let secondNum = sortedTwo[idxTwo]
        
        if firstNum < secondNum {
            current = secondNum - firstNum
            idxOne += 1
        } else if secondNum < firstNum {
            current = firstNum - secondNum
            idxTwo += 1
        } else {
            return [firstNum, secondNum]
        }
        
        if smallest > current {
            smallest = current
            result = [firstNum, secondNum]
        }
    }
    
    return result
}

let testOneArrayOne = [-1, 5, 10, 20, 28, 3]
let testOneArrayTwo = [26, 134, 135, 15, 17]
let testOneExpectedResult = [28, 26]
let testOneActualResult = smallestDifference(arrayOne: testOneArrayOne, arrayTwo: testOneArrayTwo)
assert(testOneActualResult == testOneExpectedResult)

