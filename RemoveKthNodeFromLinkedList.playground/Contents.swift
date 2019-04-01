import Cocoa

public func removeKthNodeFrom(linkedList: inout LinkedList<Int>, k: Int) {
    var nodeBeforeRemove = linkedList.head
    var end = linkedList.head
    
    for _ in 1...k {
        end = end?.next
    }
    
    if end == nil {
        linkedList.pop()
        return
    }
    
    while let next = end?.next {
        nodeBeforeRemove = nodeBeforeRemove?.next
        end = next
    }
    
    nodeBeforeRemove?.next = nodeBeforeRemove?.next?.next
}


var linkedList = LinkedList<Int>()
for i in 0..<10 {
    linkedList.append(i)
}

removeKthNodeFrom(linkedList: &linkedList, k: 10)
print(linkedList)
