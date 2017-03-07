//: Playground - noun: a place where people can play

import UIKit

class Human {
	var name = "aney"
	var age = 20
	var address = "Seoul"
	var job = "student"
	var gender = "He"
	
	func describe() {
		print("\(name) is \(age) years old.")
		print("\(gender) lives in \(address).")
		print("\(gender) is a \(job)")
	}
}

var aney = Human()

aney.name

var marco = Human()
marco.name = "marco"
marco.describe()


class NewHuman {
	var name: String?
	var age: Int?
	var address: String?
	var job: String?
	var gender: String?
	
	init(name: String, age: Int, address: String, job: String, gender: String) {
		self.name = name
		self.age = age
		self.address = address
		self.job = job
		self.gender = gender
	}
	
	func describe() {
		print("\(name!) is \(age!) years old.")
		print("\(gender!) lives in \(address!).")
		print("\(gender!) is a \(job!)")
	}
}

var scott = NewHuman(name: "scott", age: 20, address: "Seoul", job: "student", gender: "He")

//scott.describe()


class GentleMan: NewHuman {
	override func describe() {
		super.describe()
		print("Hello, nice to meet you. My name is \(name!)")
	}
}

var tom = GentleMan(name: "tom", age: 20, address: "Seoul", job: "student", gender: "He")

tom.describe()
tom.name


//struct HumanStruct {
//	
//}