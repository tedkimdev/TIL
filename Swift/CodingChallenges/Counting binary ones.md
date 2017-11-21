
Counting binary ones
====================

```swift

func challenge21a(number: Int) -> (nextHighest: Int?, nextLowest: Int?) {
  
  func ones(in number: Int) -> Int {
    let currentBinary = String(number, radix: 2)
    return currentBinary.filter { $0 == "1" }.endIndex + 1
  }
  
  let targetBinary = String(number, radix: 2)
  let targetOnes = ones(in: number)
  
  var nextHightest: Int? = nil
  var nextLowest: Int? = nil
  
  for i in number + 1...Int.max {
    if ones(in: i) == targetOnes {
      nextHightest = i
      break
    }
  }
  
  for i in (0..<number).reversed() {
    if ones(in: i) == targetOnes {
      nextLowest = i
      break
    }
  }
  
  return (nextHightest, nextLowest)
}
```

```swift

func getNumberOfOnes(_ number: Int) -> Int {
  var numberOfOnes: Int = 0
  var number = number
  
  while number > 0 {
    numberOfOnes += (number % 2 == 1) ? 1 : 0
    number /= 2
  }
  
  return numberOfOnes
}
```
