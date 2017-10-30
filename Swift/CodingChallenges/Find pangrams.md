Find pangrams
============

```swift
func challenge9(input: String) -> Bool {
  let set = Set(input.lowercased().characters)
  let letters = set.filter { $0 >= "a" && $0 <= "z"}
  
  return letters.count == 26
}

challenge9(input: "The quick brown fox jumps over the lazy dog") // true
challenge9(input: "The quick brown fox jumped over the lazy dog") //false
```
