Do two strings contain the same characters?
===============

```swift
extension String {
  func fuzzyContains(_ string: String) -> Bool {
    return self.lowercased().contains(string.lowercased())
  }
  
  func fuzzyContains2(_ string: String) -> Bool {
//    print(self.uppercased().range(of: string.uppercased()))
    return self.uppercased().range(of: string.uppercased()) != nil
  }
  
  func fuzzyContains3(_ string: String) -> Bool {
    return range(of: string, options: .caseInsensitive) != nil
  }
}

"Hello, world".fuzzyContains("Hello") //true
"Hello, world".fuzzyContains("WORLD") //true
"Hello, world".fuzzyContains("GoodBye")//flase

"Hello, world".fuzzyContains2("Hello")
"Hello, world".fuzzyContains2("WORLD")
"Hello, world".fuzzyContains2("GoodBye")

"Hello, world".fuzzyContains3("Hello")
"Hello, world".fuzzyContains3("WORLD")
"Hello, world".fuzzyContains3("GoodBye")


```
