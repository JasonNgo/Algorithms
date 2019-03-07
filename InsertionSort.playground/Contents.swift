import Cocoa

func insertionSort(array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    var result = array
    for i in stride(from: 1, to: array.count, by: 1) {
        for j in stride(from: i, to: 0, by: -1) {
            if result[j - 1] > result[j] {
                result.swapAt(j - 1, j)
            }
        }
    }
    
    return result
}

let array = [8, 5, 2, 9, 5, 6, 3]
let expected = array.sorted()
assert(insertionSort(array: array) == expected)

let array2 = [0, 1, 2, 3]
let expected2 = array2.sorted()
assert(insertionSort(array: array2) == expected2)

let array3 = [2, 3, 1, 0]
let expected3 = array3.sorted()
assert(insertionSort(array: array3) == expected3)
