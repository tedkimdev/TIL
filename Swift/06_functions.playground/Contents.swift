//: Playground - noun: a place where people can play

import UIKit

var name1 = "aney"
var age1 = 20
var address1 = "Seoul"
var job1 = "student"
var gender1 = "He"

var name2 = "marco"
var age2 = 20
var address2 = "Seoul"
var job2 = "student"
var gender2 = "She"

var name3 = "scott"
var age3 = 20
var address3 = "Seoul"
var job3 = "student"

var name4 = "irene"
var age4 = 20
var address4 = "Seoul"
var job4 = "student"

print("\(name1) is \(age1) years old.")
print("\(gender1) lives in \(address1)")
print("\(gender1) is a \(job1)")

print("\(name2) is \(age2) years old.")
print("He/she lives in \(address2)")
print("He/she is a \(job2)")

func describe(name: String, age: Int, address: String, job: String, gender: String) {
	print("\(name) is \(age) years old.")
	print("He/she lives in \(address)")
	print("\(gender) is a \(job)")
}

describe(name: name1, age: age1, address: address1, job: job1, gender: gender1)

describe(name: name2, age: age2, address: address2, job: job2, gender: gender2)

func greeting(_ name: String) -> String {
	return "Hello, \(name)"
}


let result = greeting("aney")
print(result)

func greeting2(_ name: String) {
	print("Hello, \(name)")
}

greeting2("scott")

func greeting3() -> String{
	return "Hello world!"
}

print(greeting3())

func greeting4() {
	print("Hello world!")
}

greeting4()

func greeting5(_ name: String, gender: String) -> String {
	return "Hello, \(gender) is \(name)"
}

let result2 = greeting5("aney", gender: "he")
print(result2)