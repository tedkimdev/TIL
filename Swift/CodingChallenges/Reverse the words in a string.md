Reverse the words in a string
=============================

```swift
import Foundation

func challenge15(input: String) -> String {
  
  let array = input.components(separatedBy: " ")
  
  let result = array.map { $0.characters.reversed().map { String($0) }.joined() }
  
  return result.joined(separator: " ")
}


challenge15(input: "swift Codinddddg")

func challenge15a(input: String) -> String {
  let parts = input.components(separatedBy: " ")
  let reversed = parts.map { String($0.characters.reversed()) }
  
  return reversed.joined(separator: " ")
}

challenge15a(input: "Swift Coding")
```
