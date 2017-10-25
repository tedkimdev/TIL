
Remove duplicate letters from a string
==================

```swift
func challenge6a(input: String) -> String {
  let array = input.characters.map { String($0) }
  let set = NSOrderedSet(array: array)
  let letters = Array(set) as! Array<String>
  return letters.joined()
}

func challenge6b(input: String) -> String {
  var used = [Character]()
  
  for letter in input.characters {
    if used.contains(letter) {
      continue
    } else {
      used.append(letter)
    }
  }
  
  return String(used)
}


func challenge6c(input: String) -> String {
  var used = [Character: Bool]()
  
  let result = input.characters.filter {
    used.updateValue(true, forKey: $0) == nil
  }
  
  return String(result)
}

challenge6a(input: "mmisisisisisii")
challenge6b(input: "mmisisisisisii")
challenge6c(input: "mmisisisisisii")
```
