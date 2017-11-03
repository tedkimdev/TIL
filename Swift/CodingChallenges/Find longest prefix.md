Find longest prefix
===================

```swift


func challenge12(input: String) -> String {
  
  var strings = input.components(separatedBy: " ")
  
  var currentPrefix = ""
  var bestPrefix = ""
  
  
  for letter in strings[0].characters {
    currentPrefix.append(letter)
    
    for string in strings {
      if !string.hasPrefix(currentPrefix) {
        return bestPrefix
      }
    }
    bestPrefix = currentPrefix
  }
  
  return bestPrefix
}

challenge14(input: "fleee fleaa flec")

```
