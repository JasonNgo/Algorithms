import Cocoa

public func threeSum(input: [Int], target: Int) -> [[Int]] {
    let sortedInput = input.sorted()
    var result: [[Int]] = []
    
    for i in 0..<sortedInput.count - 2 {
        var left = i + 1
        var right = sortedInput.count - 1
        
        while left < right {
            let sum = sortedInput[i] + sortedInput[left] + sortedInput[right]
            
            if sum > target {
                right -= 1
            } else if sum < target {
                left += 1
            } else if sum == target {
                result.append([sortedInput[i], sortedInput[left], sortedInput[right]])
                left += 1
                right -= 1
            }
        }
    }
    
    return result
}

let input = [12, 3, 1, 2, -6, 5, -8, 6]
threeSum(input: input, target: 0)
