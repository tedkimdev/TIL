```swift
// Closures

func doMath(int1: Int, int2: Int, mathFunc: (Int, Int) -> Int) -> Int {
  return mathFunc(int1, int2)
}

func multiply(int1: Int, int2: Int) -> Int {
  return int1 * int2
}

doMath(int1: 2, int2: 5, mathFunc: multiply(int1:int2:))

doMath(int1: 4, int2: 5) { (int1, int2) -> Int in
  return int1 * int2
}


// Higher Order Functions and Typealias

let myStrings = ["a", "b", "c", "d", "e"]

typealias changeValue = (String) -> String

func upperCaseArray(strings: [String]) -> [String] {
  return changeArray(strings: strings, theEditFunction: { $0.uppercased() })
}

func doubleArray(strings: [String]) -> [String] {
  return changeArray(strings: strings, theEditFunction: { $0 + $0 })
}

func changeArray(strings: [String], theEditFunction: changeValue) -> [String] {
  var newArray: [String] = []
  for string in strings {
    newArray.append(theEditFunction(string))
  }
  return newArray
}

print(doubleArray(strings: upperCaseArray(strings: myStrings)))

print(changeArray(strings: myStrings) { $0 + $0 + $0 + "Heyo" })


// Map, Filter, Reduce

let luckyNumbers = [2323232, 5, 6, 7, 8, 45, 43]
let dogs = ["Fido": 8, "Sarah": 32, "Sean": 16]

// Map
print(luckyNumbers.map { String($0) })
print(dogs.map { "\($0) is \($1)" })

// Filter
print(luckyNumbers.filter { $0 > 10 })
print(luckyNumbers.filter { $0 % 2 == 0 })
print(dogs.filter { $1 > 20 })

// Reduce
print(luckyNumbers.reduce(0) { $0 + $1 })
print(dogs.reduce("") { $0 + $1.key })
print(dogs.reduce(0) { $0 + $1.value })
```
