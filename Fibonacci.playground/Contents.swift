import Cocoa

func getNthFib(n: Int) -> Int {
    if n == 2 { return 1 }
    if n == 1 { return 0 }
    
    return getNthFib(n: n - 1) + getNthFib(n: n - 2)
}

func getNthFibIterative(n: Int) -> Int {
    var lastTwoNumbers = (first: 0, last: 1)
    var counter = 3
    
    while counter <= n {
        let sum = lastTwoNumbers.first + lastTwoNumbers.last
        lastTwoNumbers.first = lastTwoNumbers.last
        lastTwoNumbers.last = sum
        counter += 1
    }
    
    return n > 1 ? lastTwoNumbers.last : lastTwoNumbers.first
}
