Calculate a square root by hand
===============================

```swift

func challenge25(input: Int) -> Int {
  for i in 0...input/2 {
    if i * i > input {
      return i - 1
    }
  }
  return 0
}

func challenge25b(input: Int) -> Int {
  guard input != 1 else { return 1 }
  
  var lowerBound = 0
  var upperBound = 1 + input / 2
  
  while lowerBound + 1 < upperBound {
    let middle = lowerBound + ((upperBound - lowerBound) / 2)
    let middleSquared = middle * middle
    
    if middleSquared == input {
      return middle
    } else if middleSquared < input {
      lowerBound = middle
    } else {
      upperBound = middle
    }
  }
  
  return lowerBound
}

func challenge25c(input: Int) -> Int {
  return Int(floor(pow(Double(input), 0.5)))
}

```
