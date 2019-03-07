// Given a BST and a target value, return the value closest to the target value

// Solution 1: Recursive:
// Call the recursive function that keeps track of a current closest value. As the recursive function steps down the
// BST, it compares the current closest value to the current nodes value and reassigns the closest value accordingly.
// It then checks if it should continue stepping down, based on if the current closest is the target, to
// the left or right side.

// Time Complexity: O(log(n))
// Space Complexity: O(log(n))
// Has a run-time of O(log(n)), since at each step of the recursive function, half of the tree is cut out of the
// possible input. It has a space time of O(log(n)) because it's a recursive function that'll allocate memory onto
// the stack.

import Cocoa

class Node {
    let value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
    }
}

func findClosestValueInBST(tree: Node?, target: Int) -> Int {
    guard let tree = tree else { return -1 }
    var closest = Int.max
    return findClosestValue(node: tree, target: target, closest: &closest)
}

func findClosestValue(node: Node?, target: Int, closest: inout Int) -> Int {
    guard let node = node else { return Int.max }
    
    if abs(target - closest) > abs(target - node.value) {
        closest = node.value
    }
    
    if target > node.value && node.right != nil {
        return findClosestValue(node: node.right!, target: target, closest: &closest)
    } else if target < node.value && node.left != nil {
        return findClosestValue(node: node.left!, target: target, closest: &closest)
    } else {
        return closest
    }
}

func findClosestValueIterative(node: Node?, target: Int, closest: inout Int) -> Int {
    var currentNode: Node? = node
    closest = currentNode?.value ?? Int.max
    
    while currentNode != nil {
        if let left = currentNode?.left, left.value < target {
            currentNode = node?.left
        } else if let right = currentNode?.right, right.value > target {
            currentNode = node?.right
        } else {
            break
        }
    }
    
    return closest
}
