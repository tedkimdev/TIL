Condense Whitespace
===========

```swift
import Foundation

func challenge7(input: String) -> String {
  
  var previousLetter: Character = "a"
  var result = ""
  for letter in input.characters {
    if letter == " " && previousLetter != " " {
      result.append(letter)
    } else if letter != " " {
      result.append(letter)
    }
    previousLetter = letter
  }
  
  return result
}



func challenge7a(input: String) -> String {
  var seenSpace = false
  var returnValue = ""
  
  for letter in input.characters {
    if letter == " " {
      if seenSpace { continue }
      seenSpace = true
    } else {
      seenSpace = false
    }
    returnValue.append(letter)
  }
  return returnValue
}

func challenge7b(input: String) -> String {
  return input.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
}

challenge7(input: " a   b a")
challenge7a(input: " a   b a")
challenge7b(input: " a   b a")
```
