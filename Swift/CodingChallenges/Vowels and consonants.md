Vowels and consonants
======================

```swift
func challenge10(input: String) -> (vowels: Int, consonants: Int) {

  let vowelCount = input.characters.map { String($0) }
    .filter { "aeiou".contains($0) }.count
  let consonantCount = input.characters.map { String($0) }
    .filter { "bcdfghjklmnpqrstvwxyz".contains($0) }.count
    
  return (vowelCount, consonantCount)
}


challenge10(input: "Miasiassikpi")
```
