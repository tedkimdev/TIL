Queue
=====

Queue data structure

A queue implements the following seven operations:
```
enqueue() - Adds an element to the back of the queue

dequeue() - Removes and returns the first element from the queue

peek() - Returns the first element from the queue, but does not remove it

clear() - Resets the queue to an empty state

count - Returns the number of elements in the queue

isEmpty() - Returns true if the queue is empty, and false otherwise

isFull() - Returns true if the queue is full, and false otherwise
```

Common implementations can also include helper methods such as the following:
```
capacity - A read/write property for retrieving or setting the queue capacity

insert(_:atIndex) - A method that inserts an element at a specified index in the queue

removeAtIndex(_) - A method that removes an element at the specified index
```

```swift
public struct Queue<T> {
  fileprivate var array = [T?]()
  fileprivate var head = 0
  
  public var isEmpty: Bool {
    return count == 0
  }

  public var count: Int {
    return array.count - head
  }
  
  public mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  public mutating func dequeue() -> T? {
    guard head < array.count, let element = array[head] else { return nil }

    array[head] = nil
    head += 1

    let percentage = Double(head)/Double(array.count)
    if array.count > 50 && percentage > 0.25 {
      array.removeFirst(head)
      head = 0
    }
    
    return element
  }
  
  public var front: T? {
    if isEmpty {
      return nil
    } else {
      return array[head]
    }
  }
}
```


Ref
---
https://github.com/raywenderlich/swift-algorithm-club/tree/master/Queue
