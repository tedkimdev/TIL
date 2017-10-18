Are the letters unique?
=======================
```swift

func challenge1(input: String) -> Bool {
  var set: Set<Character> = Set<Character>()
  
  for char in input.characters {
    set.insert(char)
  }
  if set.count != input.characters.count {
    return false
  }
  return true
}


challenge1(input: "No duplicates") // true
challenge1(input: "abcdefghijklmnopqrstuvwxyz") // true
challenge1(input: "AaBbCc") // true
challenge1(input: "Hello, world") // false


func challenge1a(input: String) -> Bool {
  var usedLetters = [Character]()
  for letter in input.characters {
    if usedLetters.contains(letter) {
      return false
    }
    usedLetters.append(letter)
  }
  return true
}
// contains method is a O(N) operation.

func challenge1b(input: String) -> Bool {
  return Set(input.characters).count == input.characters.count
}
```
