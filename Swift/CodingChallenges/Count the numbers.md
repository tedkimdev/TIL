Count the numbers
=================

```swift

extension Collection where Iterator.Element == Int {
  
  func challenge37a(count: Character) -> Int {
    
    var total = 0
    
    for item in self {
      let str = String(item)
      
      for letter in str.characters {
        if letter == count {
          total += 1
        }
      }
    }
    return total
  }
  
  func challenge37b(count: Character) -> Int {
    
    return self.reduce(0) {
      let boolArray = String($1).characters.filter { $0 == count }
      return $0 + boolArray.count
    }
  }
  
}

print([1,22,13,41].challenge37a(count: "1"))
print([1,22,13,41].challenge37b(count: "1"))
```
