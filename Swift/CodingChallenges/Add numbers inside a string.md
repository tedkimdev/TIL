Add numbers inside a string
===========================

```swift

func challenge24(string: String) -> Int {
  
  var currentNumber = ""
  var sum = 0
  
  for letter in string.characters {
    let strLetter = String(letter)
    
    if Int(strLetter) != nil {
      currentNumber += strLetter
    } else {
      sum += Int(currentNumber) ?? 0
      currentNumber = ""
    }
  }
  sum += Int(currentNumber) ?? 0
  
  return sum
}

print(challenge24(string: "1b20c3c"))

func challenge24b(string: String) -> Int {
  let regex = try! NSRegularExpression(pattern: "(\\d+)", options: [])
  let matches = regex.matches(in: string, options: [], range: NSRange(location: 0, length: string.utf16.count))
  let allNumbers = matches.flatMap { Int((string as NSString).substring(with: $0.range)) }
  
  return allNumbers.reduce(0, +)
}

```
