Integer disguised as String
===========================

```swift

func challenge23me(input: String) -> Bool {
  return input.map { String($0) }.filter { !"0123456789".contains($0) }.count > 0 ? false : true
}
func challenge23(input: String) -> Bool {
  return UInt(input) != nil
}

challenge23(input: "9223372036854775808") // 2^63 -1 = 9223372036854775807
challenge23me(input: "9223372036854775808")
// In Swift, the ceiling is 9,223,372,036,854,775,807, whici is the largest number that can be presented by a signed 64-bit integer.

func challenge23a(input: String) -> Bool {
  for letter in input.characters {
    if Int(String(letter)) == nil {
      return false
    }
  }
  return true
}

challenge23a(input: "9223372036854775808")

func challenge23b(input: String) -> Bool {
  return input.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
}

func challenge23c(input: String) -> Bool {
  return input.rangeOfCharacter(from: CharacterSet(charactersIn: "0123456789").inverted) == nil
}
```
