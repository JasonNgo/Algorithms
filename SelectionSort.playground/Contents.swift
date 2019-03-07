import Cocoa

func selectionSort(array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    var result = array
    var currentIndex = 0
    
    while currentIndex < array.count - 1 {
        var smallestIndex = currentIndex
        for i in stride(from: currentIndex + 1, to: array.count, by: 1) {
            if result[smallestIndex] > result[i] {
                smallestIndex = i
            }
        }
        
        result.swapAt(currentIndex, smallestIndex)
        currentIndex += 1
    }
    
    return result
}

let array1 = [8, 5, 2, 9, 5, 6, 3]
let expected1 = array1.sorted()
assert(selectionSort(array: array1) == expected1)
