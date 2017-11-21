Recreate the pow() function
============================

```swift

func challenge18a(number: Int, power: Int) -> Int {
  guard number > 0, power > 0 else { return 0 }
  
  var returnValue = number
  
  for _ in 1..<power {
    returnValue *= number
  }
  
  return returnValue
}

func challenge18b(number: Int, power: Int) -> Int {
  guard number > 0, power > 0 else { return 0 }
  
  if power == 1 { return number }
  
  return number * challenge18b(number: number, power: power-1)
}

````
