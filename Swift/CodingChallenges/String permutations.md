String permutations
===================

```swift
import Foundation


func permutation(input: String, current: String = "") {
  var array = input.characters.map { String($0) }
  if input.count == 1 {
    print(current+input)
    return
  } else {
    for i in 0..<array.count {
      let newCurrentString = current + array[i]
      var temp = array[0..<i]
      temp.append(contentsOf: array[i+1..<array.count])
      
      permutation(input: temp.joined(), current: newCurrentString)
    }
  }
}

permutation(input: "wombat")

func challenge14(string: String, current: String = "") {
  let length = string.characters.count
  let strArray = Array(string.characters)
  
  if length == 0 {
    print(current)
    print("******")
  } else {
    
    for i in 0..<length {
      let left = String(strArray[0..<i])
      let right = String(strArray[i+1..<length])
      challenge14(string: left + right, current: current + String(strArray[i]))
    }
  }
}

challenge14(string: "wombat")

```
