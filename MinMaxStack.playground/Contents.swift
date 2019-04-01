import Cocoa

public struct MinMaxStack<Value: Comparable> {
    private var storage: [Value] = []
    private var min: Value?
    private var max: Value?
    
    var isEmpty: Bool {
        return storage.isEmpty
    }
    
    func peek() -> Value? {
        return storage.last
    }
    
    mutating func push(_ value: Value) {
        
    }
    
    @discardableResult
    mutating func pop() -> Value? {
        return nil
    }
    
    func getMin() -> Value? {
        return nil
    }
    
    func getMax() -> Value? {
        return nil
    }
    
}
