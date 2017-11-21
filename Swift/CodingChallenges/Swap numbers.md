Swap numbers
============

```swift
func challenge19a(_ a: inout Int, _ b: inout Int) {
  a = a + b
  b = a - b
  a = a - b
}

func challenge19b(_ a: inout Int, _ b: inout Int) {
  a = a ^ b
  b = a ^ b
  a = a ^ b
}

func challenge19c(_ a: inout Int, _ b: inout Int) {
  (a, b) = (b, a)
}

var c = 3
var d = 4
print(c, d)
challenge19c(&c, &d)
print(c, d)
```
