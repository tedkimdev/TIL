
Do two strings contain the same characters
==========

```swift
challenge3(input1: "a1 b2", input2: "b 1 a 2")

func challenge3a(string1: String, string2: String) -> Bool {
  var checkString = string2
  
  for letter in string1.characters {
    if let index = checkString.characters.index(of: letter) { //O(n)
      checkString.characters.remove(at: index)  //O(n)
    } else {
      return false
    }
  }
  
  return checkString.characters.count == 0
}

func challenge3b(string1: String, string2: String) -> Bool {
  let array1 = Array(string1.characters)
  let array2 = Array(string2.characters)
  
  return array1.count == array2.count && array1.sorted() == array2.sorted()
}
```
