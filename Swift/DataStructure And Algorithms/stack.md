Stack
=====

stack data structure

A stack implements the following three methods:
```swift
push() - Adds an element to the bottom of a stack

pop() - Removes and returns an element from the top of a stack

peek() - Returns the top element from the stack, but does not remove it
```

Common implementations can also include helper operations such as the following:
```swift
count - Returns the number of elements in a stack

isEmpty() - Returns true if the stack is empty, and false otherwise

isFull() - If a stack limits the number of elements, this method will return true if it is full and false otherwise
```

Applications
------------
Common applications for stacks are expression evaluation and syntax parsing, converting an integer number to a binary number, backtracking algorithms, and supporting undo/redo functionality using the Command design pattern.

```swift
public struct Stack<T> { 
    private var elements = [T]() 
    public init() {} 
     
    public mutating func pop() -> T? { 
        return self.elements.popLast()  
    }
 
     
    public mutating func push(element: T){ 
        self.elements.append(element) 
    }
 
     
    public func peek() -> T? { 
        return self.elements.last 
    }
 
     
    public func isEmpty: Bool { 
        return self.elements.isEmpty 
    }
 
     
    public var count: Int { 
        return self.elements.count 
    } 
     
}
```
