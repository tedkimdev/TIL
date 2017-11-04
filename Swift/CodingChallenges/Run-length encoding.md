Run-length encoding
===================

```swift

import Foundation

func challenge13(input: String) -> String {
  var array = [String]()
  var arrayValue = [Int]()
  var stringArray = input.characters.map { String($0) }
  
  var previousLetter = stringArray.first!
  var count = 0
  for i in 0..<stringArray.count {
    if previousLetter != stringArray[i] {
      array.append(previousLetter)
      arrayValue.append(count)
      count = 1
    } else {
      count += 1
      
    }
    previousLetter = stringArray[i]
    
    if i == stringArray.count-1 {
      array.append(previousLetter)
      arrayValue.append(count)
    }
  }
  
  var result = ""
  for i in 0..<array.count {
    result.append(array[i])
    result.append(String(arrayValue[i]))
  }
  
  return result
}


// 13a is better than 13b
func challenge13a(input: String) -> String {
  var currentLetter: Character?
  var returnValue = ""
  var letterCounter = 0
  
  for letter in input.characters {
    if letter == currentLetter {
      letterCounter += 1
    } else {
      if let current = currentLetter {
        returnValue.append("\(current)\(letterCounter)")
      }
      
      currentLetter = letter
      letterCounter = 1
    }
  }
  
  if let current = currentLetter {
    returnValue.append("\(current)\(letterCounter)")
  }
  
  return returnValue
}

func challenge13b(input: String) -> String {
  var returnValue = ""
  var letterCounter = 0
  var letterArray = Array(input.characters)
  
  for i in 0..<letterArray.count {
    letterCounter += 1
    if i + 1 == letterArray.count || letterArray[i] != letterArray[i + 1] {
      returnValue += "\(letterArray[i])\(letterCounter)"
      letterCounter = 0
    }
  }
  
  return returnValue
}

challenge13(input: "aabbcaaaac")
challenge13a(input: "aabbcaaaac")
challenge13b(input: "aabbcaaaacdd")

```
