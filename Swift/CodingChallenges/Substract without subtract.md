
Substract without subtract(without using -)
==========================================
```swift
func challenge26(substract: Int, from: Int) -> Int {
  return from + (~substract + 1)
}

challenge26(substract: 5, from: 9)
```

```
00000000 is 0
00000001 is 1
00000010 is 2
00000100 is 4
01111111 is 127

00000000 is 0
11111111 is -1
11111110 is -2
11111100 is -4
10000001 is -127
10000000 is -128
```
