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
