//: Playground - noun: a place where people can play

import UIKit

// collection
var set: Set<String> = ["미국", "캐나다"]

var set2 = Set<String>()
set2 = ["양념치킨", "간장게장", "부대찌개"]

var dictionary: [String:String] = [:]
dictionary["바나나"] = "흡수가 빠르다"
dictionary["망고"] = "달고 칼로리가 높다"
dictionary["수박"] = "수분이 많다."

dictionary["바나나"]
dictionary["망고"]
dictionary["수박"]


// function
func myFavoriteFood() {
  print("나는 치킨을 좋아합니다.")
}

func myFavoriteFood2() -> String {
  return "치킨"
}

func myFavoriteFood3(_ food: String) {
  print("나는 \(food)을 좋아합니다.")
}

func myFavoriteFood4(_ food: String) -> String {
  return food
}


// #1 Score (condition flow)
let score = 77

if score >= 90 {
  print("A")
} else if score >= 80 {
  print("B")
} else if score >= 70 {
  print("C")
} else {
  print("F")
}


// #2 Calculator (class)
class Calculator {
  var operandInt1: Int?
  var operandInt2: Int?
  
  init(operandInt1: Int, operandInt2: Int) {
    self.operandInt1 = operandInt1
    self.operandInt2 = operandInt2
  }
  
  func add() -> Int? {
    if let operandInt1 = self.operandInt1,
      let operandInt2 = self.operandInt2 {
      return operandInt1 + operandInt2
    }
    return nil
  }
  
  func subtract() -> Int? {
    if let operandInt1 = self.operandInt1,
      let operandInt2 = self.operandInt2 {
      return operandInt1 - operandInt2
    }
    return nil
  }
  
  func multiply() -> Int? {
    if let operandInt1 = self.operandInt1,
      let operandInt2 = self.operandInt2 {
      return operandInt1 * operandInt2
    }
    return nil
  }
  
  func divide() -> Float? {
    if let operandInt1 = self.operandInt1,
      let operandInt2 = self.operandInt2,
      operandInt2 != 0 {
      return Float(operandInt1) / Float(operandInt2)
    }
    return nil
  }
}

var calculator = Calculator(operandInt1: 5, operandInt2: 3)
calculator.add()
calculator.subtract()
calculator.multiply()
calculator.divide()

var calculator2 = Calculator(operandInt1: 3, operandInt2: 0)
calculator2.add()
calculator2.subtract()
calculator2.multiply()
calculator2.divide()


// #3 Diamond (repetition)
// 00100
// 01110
// 11111
// 01110
// 00100
func printDiamond(_ number: Int) {
  var result = ""
  for i in 1...(number * 2 - 1) {
    for j in 1...(number * 2 - 1) {
      if i <= number {
        if j > number - i && j < number + i {
          result += "1"
        } else {
          result += "0"
        }
      } else {
        if j > i - number && j < number * 3 - i {
          result += "1"
        } else {
          result += "0"
        }
      }
    }
    print(result)
    result = ""
  }
}

printDiamond(3)