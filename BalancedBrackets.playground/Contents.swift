/**
 *  Problem: Determine if a given string of brackets is balanced
 **/

import Cocoa

public struct Stack<Value> {
    private var storage: [Value] = []
    
    var isEmpty: Bool {
        return storage.isEmpty
    }
    
    func peek() -> Value? {
        return storage.last
    }
        
    mutating func push(_ value: Value) {
        storage.append(value)
    }
    
    @discardableResult
    mutating func pop() -> Value? {
        return storage.popLast()
    }
}


func balancedBrackets(input: String) -> Bool {
    guard !input.isEmpty else {
        return true
    }
    
    var stack = Stack<Character>()
    
    for char in input {
        guard let top = stack.peek() else {
            stack.push(char)
            continue
        }
        
        if top == "(" && char == ")" || top == "{" && char == "}" || top == "[" && char == "]" {
            stack.pop()
        } else {
            stack.push(char)
        }
    }
    
    return stack.isEmpty
}

assert(balancedBrackets(input: "()[]{}{") == false)
assert(balancedBrackets(input: "()()[{()})]") == false)
assert(balancedBrackets(input: "([])(){}(())()()") == true)
