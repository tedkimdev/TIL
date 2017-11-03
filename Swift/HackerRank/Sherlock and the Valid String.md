Sherlock and the Valid String
=============================

https://www.hackerrank.com/challenges/sherlock-and-valid-string/problem

```swift
import Foundation

func challenge(input: String) -> Bool {
  var dict: [Character: Int] = [Character: Int]()
  var set = Set<Character>()

  for letter in input.characters {
    if dict[letter] == nil{
      set.insert(letter)
      dict[letter] = 1
    } else {
      dict[letter]! += 1
    }
  }
  
  var dict2: [Int: Int] = [Int: Int]()
  for value in dict.values {
    if dict2[value] == nil {
      dict2[value] = 1
    } else  {
      dict2[value]! += 1
    }
  }
  
  if dict2.keys.count == 1 {
    return true
  } else if dict2.keys.count > 2 {
    return false
  } else if dict2.keys.count == 2 {
    let count = dict2.values.filter{$0 > 1}.count
    
    if count == 2 { 
      return false 
    } else if dict2[1] == 1 {
      return true 
    } else if abs(Array(dict2.keys)[0]-Array(dict2.keys)[1]) == 1 {
      return true
    } else {
      return false
    }
  }

  return false
}

let value = readLine()!

if challenge(input: value) {
  print("YES")
} else {
  print("NO")
}

```
