Red Black Tree
==============

```swift
import Foundation

enum RedBlackTreeColor: Int {
  case red
  case black
}

class RedBlackTreeNode<T: Comparable> {
  
  // MARK: Properties
  
  public var value: T
  public var leftChild: RedBlackTreeNode?
  public var rightChild: RedBlackTreeNode?
  public weak var parent: RedBlackTreeNode?
  
  public var color: RedBlackTreeColor
  
  
  // MARK: Initializing
  
  public convenience init(value: T) {
    self.init(value: value, leftChild: nil, rightChild: nil, parent: nil, color: .black)
  }
  
  public init(value: T, leftChild: RedBlackTreeNode?, rightChild: RedBlackTreeNode?, parent: RedBlackTreeNode?, color: RedBlackTreeColor) {
    self.value = value
    self.leftChild = leftChild
    self.rightChild = rightChild
    self.parent = parent
    self.color = color
  }
  
  
  // MARK: Helper methods
  
  ///Returns the grandparent of the node, or nil
  public func grandParentNode() -> RedBlackTreeNode? {
    guard let grandParentNode = self.parent?.parent else { return nil }
    return grandParentNode
  }
  
  /// Returns the "uncle" of the node, or nil if doesn't exist.
  /// This is the sibling of its parent node
  public func uncleNode() -> RedBlackTreeNode? {
    guard let grandParentNode = self.grandParentNode() else { return nil }
    if grandParentNode.leftChild === self.parent {
      return grandParentNode.rightChild
    } else if grandParentNode.rightChild === self.parent {
      return grandParentNode.leftChild
    }
    return nil
  }
  
  
  
  /// Prints each layer of the tree from top to bottom with the node value and the color
  public static func printTree(nodes: [RedBlackTreeNode]) {
    var children: [RedBlackTreeNode] = Array()
    for node: RedBlackTreeNode in nodes {
      print("\(node.value) \(node.color)")
      if let leftChild = node.leftChild {
        children.append(leftChild)
      }
      if let rightChild = node.rightChild {
        children.append(rightChild)
      }
    }
    if children.count > 0 {
      printTree(nodes: children)
    }
  }
  
}
```
