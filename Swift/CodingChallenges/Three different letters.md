Three different letters
========

```swift
func challenge11(input: String, input2: String) -> Bool {
  
  if input.characters.count != input2.characters.count {
    return false
  }
  
  var differCount = 0
  
  let inputArray = input.characters.map { String($0) }
  let input2Array = input2.characters.map { String($0) }
  
  for i in 0..<inputArray.count {
    if inputArray[i] != input2Array[i] {
      differCount += 1
    }
    
    if differCount > 3 {
      return false
    }
  }
  
  return true
}


challenge11(input: "Clamp", input2: "Clamp")//true
challenge11(input: "Clamp", input2: "Cramp")//true
challenge11(input: "Clamp", input2: "Gramp")//true
challenge11(input: "Clamp", input2: "Grans")//false
challenge11(input: "Clamp", input2: "Clam") //false
challenge11(input: "Clamp", input2: "maple") //false


func challenge11a(first: String, second: String) -> Bool {
  
  guard first.characters.count == second.characters.count else { return false }
  
  let firstArray = Array(first.characters)
  let secondArray = Array(second.characters)
  var differences = 0
  
  for (index, letter) in firstArray.enumerated() {
    if secondArray[index] != letter {
      differences += 1
    }
    if differences == 4 {
      return false
    }
  }
  
  return true
}
```


