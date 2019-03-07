import Cocoa

func bubbleSort(array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    var result = array
    var isSorted = false
    var counter = 0
    
    while !isSorted {
        isSorted = true
        
        for i in stride(from: 0, to: array.count - counter - 1, by: 1) {
            if result[i] > result[i + 1] {
                result.swapAt(i, i + 1)
                isSorted = false
            }
        }
    
        counter += 1
    }
    
    return result
}

let input = [8, 5, 2, 9, 5, 6, 3]
let expected = input.sorted()
assert(bubbleSort(array: input) == expected)
