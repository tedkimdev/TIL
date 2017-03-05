//: Playground - noun: a place where people can play

import UIKit

// implicit
var str = "Hello, playground"
var number = 1

// explicit
var str2: String = "Hello"
//var str3: String = 1	//error

var number2: Int = 33
//var number3: Int = "playground"	//error


// convert String to Integer
10 + 11
"10" + "11"
//"10" + 11	//error

var numStr = "10"
Int(numStr)

var numStr2 = "hello"
Int(numStr2)	//nil

// convert Integer to String
var number3 = 5
var str3 = "Hello"
"\(number3)"
"\(str3)! \(number3)"	//Hello! 5
String(number3)


// Integer
3 / 2

// Double & Float
3.0 / 2.0

// convert Double to Integer
Int(3.0 / 2.0)