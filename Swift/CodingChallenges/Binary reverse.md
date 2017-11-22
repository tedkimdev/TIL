Binary reverse
==============

```swift
func challenge22(_ number: UInt) -> UInt {
  let binary = String(number, radix: 2)
  
  let paddingAmount = 8 - binary.count
  let paddedBinary = String(repeating: "0", count: paddingAmount) + binary
  let reversedBinary = String(paddedBinary.reversed())

  return UInt(reversedBinary, radix: 2)!
}

challenge22(41)
```
