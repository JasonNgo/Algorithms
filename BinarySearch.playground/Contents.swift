import Cocoa

func binarySearch(array: [Int], target: Int) -> Int {
    var range = 0..<array.count
    return binarySearchIterative(array: array, target: target, range: &range)
}

func binarySearchRecursive(array: [Int], target: Int, range: Range<Int>) -> Int {
    if range.lowerBound > range.upperBound { return -1 }
    
    let middle = range.lowerBound + ((range.upperBound - range.lowerBound) / 2)
    let potentialMatch = array[middle]
    
    if target == potentialMatch {
        return middle
    } else if target > potentialMatch {
        return binarySearchRecursive(array: array, target: target, range: middle+1..<range.upperBound)
    } else {
        return binarySearchRecursive(array: array, target: target, range: range.lowerBound..<middle-1)
    }
}

func binarySearchIterative(array: [Int], target: Int, range: inout Range<Int>) -> Int {
    while range.lowerBound <= range.upperBound {
        let middle = range.lowerBound + ((range.upperBound - range.lowerBound) / 2)
        let potentialMatch = array[middle]
        
        if target == potentialMatch {
            return middle
        } else if target > potentialMatch {
            range = middle+1..<range.upperBound
        } else {
            range = range.lowerBound..<middle-1
        }
    }
    
    return -1
}

let input = [0,1,21,33,45,45,61,71,72,73]
let target = 33

binarySearch(array: input, target: target)
