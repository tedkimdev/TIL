//: Playground - noun: a place where people can play

import UIKit

let thisIsTrue = true

if thisIsTrue {
	print("this is true")
} else {
	print("this is false")
}


let num1 = 5
let num2 = 3

if num1 > num2 {
	print("num1 is greater than num2")
}

var str: String?
str = "hello"
print(str)
print(str!)

if let result = str {
	print(result)
}

if let result = Int("hello") {
	print(result)
} else {
	print("no result")
}

