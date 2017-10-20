Count the characters
=============

```swift
func challenge5(string: String, character: Character) -> Int {
  return string.characters.reduce(0) { (result, char) -> Int in
    if character == char {
      return result+1
    } else {
      return result
    }
  }
}

challenge5(string: "the a aa ", character: "a")

func challenge5a(input: String, count: Character) -> Int {
  var letterCount = 0
  for letter in input.characters {
    if letter == count {
      letterCount += 1
    }
  }
  return letterCount
}


func challenge5b(input: String, count: Character) -> Int {
  return input.characters.reduce(0, {
    $1 == count ? $0 + 1 : $0
  })
}
// 10% slower than challenge5a

func challenge5c(input: String, count: String) -> Int {
  let array = input.characters.map { String($0) }
  let counted = NSCountedSet(array: array)
  
  return counted.count(for: count)
}

func challenge5d(input: String, count: String) -> Int {
  let modified = input.replacingOccurrences(of: count, with: "")
  return input.characters.count - modified.characters.count
}
```
