String is rotated
=====

```swift
import Foundation

func challenge8(input: String, rotated: String) -> Bool {
  guard input.characters.count == rotated.characters.count else { return false }
  
  var rotatedString = input
  var temp = ""
  
  for _ in 0...input.characters.count {
    temp.append(rotatedString.last!)
    
    temp.append(contentsOf: rotatedString.dropLast())
    print(temp)
    if temp == rotated {
      return true
    } else {
      rotatedString = temp
    }
    temp = ""
  }
  
  return false
}

func challenge8a(input: String, rotated: String) -> Bool {
  guard input.characters.count == rotated.characters.count else { return false }
  let combined = input + input
  return combined.contains(rotated)
}

challenge8(input: "abcde", rotated: "deabc")
challenge8(input: "abcde", rotated: "dc")

challenge8a(input: "abcde", rotated: "deabc")
challenge8a(input: "abcde", rotated: "bc") // It has to be false.
```
