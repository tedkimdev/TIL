//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// array (list)
var someInts = [Int]()
someInts.append(1)
someInts.append(2)

var someStrings: [String] = ["hello", "hi", "nihao"]
someStrings.append("an")
someStrings[0]
someStrings[3]
someStrings[1] = "bye"
someStrings
someStrings[0...2]

// tuple
var tupleInts = (1, 2, 3)
//tupleInts.append(4)		//error


// set
var setStrings: Set<String> = Set<String>()
setStrings.insert("how")
setStrings.insert("what")
setStrings
setStrings = ["who"]
setStrings.count

// 1) 중복이 안된다.
// 2) 순서가 없다.
// 3) 집합 규칙을 사용할 수 있다.

// dictionary (hash map)
var dicStrings = [String: String]()
dicStrings["usa"] = "hello"
dicStrings["spain"] = "hola"
dicStrings
dicStrings["usa"]
dicStrings.count