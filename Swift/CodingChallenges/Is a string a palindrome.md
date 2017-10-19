Is a string a palindrome?
==================

```swift
func challenge2(input: String) -> Bool {
  let lowercase = input.lowercased()
  return lowercase.characters.reversed() == Array(lowercase.characters)
}


challenge2(input: "rotator") // true
challenge2(input: "abcdefghijklmnopqrstuvwxyz") // false
challenge2(input: "AaBbCc") // false
challenge2(input: "Hello, world") // false

```
