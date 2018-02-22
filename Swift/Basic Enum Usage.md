Basic Enum Usage
==========

```swift
//: Playground - noun: a place where people can play

import UIKit

// Mapping to Integer
enum Movement: Int {
    case Left = 0
    case Right = 1
    case Top = 2
    case Bottom = 3
}

// You can also map to strings
enum House: String {
    case Baratheon = "Ours is the Fury"
    case Greyjoy = "We Do Not Sow"
    case Martell = "Unbowed, Unbent, Unbroken"
    case Stark = "Winter is Coming"
    case Tully = "Family, Duty, Honor"
    case Tyrell = "Growing Strong"
}

// Or to floating point (also note the fancy unicode in enum cases)
enum Constants: Double {
    case π = 3.14159
    case e = 2.71828
    case φ = 1.61803398874
    case λ = 1.30357
}

let aMovement = Movement.Left

switch aMovement {
case .Left:
    print("left")
default: ()
}

if case .Left = aMovement {
    print("left")
}

if aMovement == .Left {
    print("left")
}

// Mercury = 1, Venus = 2, ... Neptune = 8
enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

// North = "North", ... West = "West"
enum CompassPoint: String {
    case North, South, East, West
}

//Swift supports the following types for the value of an enum:
//
//Integer
//Floating Point
//String
//Boolean

enum VNodeFlags : UInt32 {
    case Delete = 0x00000001
    case Write = 0x00000002
    case Extended = 0x00000004
    case Attrib = 0x00000008
    case Link = 0x00000010
    case Rename = 0x00000020
    case Revoke = 0x00000040
    case None = 0x00000080
}

//Associated Values

//enum Trade {
//    case Buy
//    case Sell
//}
//func trade(tradeType: Trade, stock: String, amount: Int) {}




//enum Trade {
//    case Buy(stock: String, amount: Int)
//    case Sell(stock: String, amount: Int)
//}
//func trade(type: Trade) {}
//
//enum Trade {
//    case Buy(String, Int)
//    case Sell(String, Int)
//}
//let tp = (stock: "TSLA", amount: 100)
//let trade = Trade.Sell(tp)
//
//if case let Trade.Sell(stock, amount) = trade {
//    print("buy \(amount) of \(stock)")
//}
//// Prints: "buy 100 of TSLA"

enum Device {
    case iPad, iPhone
    var year: Int {
        switch self {
        case .iPhone: return 2007
        case .iPad: return 2010
        }
    }
}

//Mutating Methods

enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case High:
            self = .Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
// ovenLight is now equal to .High
ovenLight.next()
// ovenLight is now equal to .Off


```
