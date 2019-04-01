import Cocoa

public func searchInSortedMatrix(matrix: [[Int]], target: Int) -> [Int] {
    var currentRow = 0
    var currentColumn = matrix[0].count - 1
    
    while currentRow < matrix.count && currentColumn >= 0 {
        if matrix[currentRow][currentColumn] == target {
            return [currentRow, currentColumn]
        }
        
        if matrix[currentRow][currentColumn] < target {
            currentRow += 1
        } else {
            currentColumn -= 1
        }
    }
    
    return [-1, -1]
}

let matrix = [
    [1, 4, 7, 12, 15, 1000],
    [2, 5, 19, 31, 32, 1001],
    [3, 8, 24, 33, 35, 1002],
    [40, 41, 42, 44, 45, 1003],
    [99, 100, 103, 106, 128, 1004]
]

assert(searchInSortedMatrix(matrix: matrix, target: 44) == [3, 3])
assert(searchInSortedMatrix(matrix: matrix, target: 6) == [-1, -1])
