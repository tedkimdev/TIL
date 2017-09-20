```swift 
enum Direction {
  case north
  case south
  case east
  case west
}

let direction = Direction.east // init

switch direction {
case .east:
  print("East")
default:
  print("direction")
}

//Raw value: Bool, Int, Float, String


//: Raw String: String
enum Food: String {
  case pizza
  case banana
  case chicken
  case bigMac
}

let stringFromRawValue = Food.banana.rawValue


enum Day: Int {
  case mon, tue, wed, thu, fri, sat, sun
}

Day.thu.rawValue

print(Day(rawValue: 6))



//Associated Value
enum Barcode {
  case upc(Int, Int, Int, Int)
  case qrCode(String)
}

var sampleQRCode = Barcode.qrCode("ABC")
var upcCode = Barcode.upc(4, 2, 4, 3)

//Validation
if case let Barcode.qrCode(value) = sampleQRCode {
  print(value)
}

if case let Barcode.upc(numberSystem, manufacturer, product, check) = upcCode {
  print(numberSystem)
  print(manufacturer)
  print(product)
  print(check)
}

let code = sampleQRCode

switch code {
case let .upc(numberSystem, manufacturer, product, check) :
  print(numberSystem)
  print(manufacturer)
  print(product)
  print(check)
case let .qrCode(productCode):
  print(productCode)
}
```

```swift
//MARK: - Practical with StoryBoard

enum Storyboard: String {
  case profile
  case setting
  case newsfeed
  
  var identifier: String {
    return self.rawValue
  }
}

let profile = Storyboard.profile
profile.identifier

// API Guideline Goal
func describeStoryboard(storyboard: Storyboard) -> String {
  switch storyboard {
  case .profile:
    return "\(storyboard.identifier): Profile picture, followers"
  case .setting:
    return "\(storyboard.identifier): Logout, invite"
  case .newsfeed:
    return "\(storyboard.identifier): videos, texts"
  }
}

describeStoryboard(storyboard: .setting)

// Mutating Methods
enum MealProcess: String {
  case breakfast, lunch, dinner
  
  var description: String {
    return self.rawValue
  }
  
  mutating func nextMeal() {
    print("Time to move on from \(self.description)")
    
    switch self {
    case .breakfast:
      self = .lunch
      print("I had a nice lunch")
    case .lunch:
      self = .dinner
      print("I had a nice dinner")
    case .dinner:
      self = .breakfast
      print("I had a nice breakfast")
    }
  }
}

var currentMeal = MealProcess.breakfast
currentMeal.nextMeal()

// Static Methods

enum AppleDevice: String {
  case iWatch, iPhone, iMac, MacPro
  
  static func getProduct(name: String) -> AppleDevice? {
    return AppleDevice(rawValue: name)
  }
  
  static func getAppleDevice(enterName: String) -> AppleDevice? {
    switch enterName {
      case "iWatch", "iPhone", "iMac", "MacPro":
      return getProduct(name: enterName)
    default:
      return nil
    }
  }
  
  init?(name: String) {
    if name == "iWatch" {
      self = .iWatch
    } else {
      return nil
    }
  }
  
}

let userProduct = AppleDevice.getAppleDevice(enterName: "MacPro")

AppleDevice(name: "ddd")
AppleDevice(name: "iWatch")

AppleDevice(rawValue: "zzz")
AppleDevice(rawValue: "MacPro")
AppleDevice(rawValue: "iWatch")

enum HttpError: String {
  case Code400 = "Bad Request"
  case Code401 = "Unauthorized"
  case Code402 = "Payment Required"
  case Code403 = "Forbidden"
  case Code404 = "Page Not Found"
  
  var description: String {
    return self.rawValue
  }
  
}

HttpError.Code400.description

//Cell Identifier

enum CellType: String {
  case ButtonValueCell
  case UnitEditCell
  case LabelCell
  case ResultLabelCell
  
  var name: String {
    return self.rawValue
  }
}
```
