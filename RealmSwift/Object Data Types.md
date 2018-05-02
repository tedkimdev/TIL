Object Data Types
=================

```swift

import Foundation
import RealmSwift
import CoreLocation

// Setup
let realm = try! Realm()

// Playground

class Car: Object {
    @objc dynamic var brand = ""
    @objc dynamic var year = 0
    
    convenience init(brand: String, year: Int) {
        self.init()
        self.brand = brand
        self.year = year
    }
    
    override var description: String {
        return "🚗 {\(brand), \(year)}"
    }
}

let car1 = Car(brand: "BMW", year: 1980)
print(car1)
```

```swift
enum Department: String {
    case technology
    case politics
    case business
    case health
    case science
    case sports
    case travel
}

class Person: Object {
    // String
    @objc dynamic var firstName = ""
    @objc dynamic var lastName: String?
    
    // Date
    @objc dynamic var born = Date.distantPast
    @objc dynamic var deceased: Date?
    
    // Data
    @objc dynamic var photo: Data?
    
    // Bool
    
    @objc dynamic var isVIP: Bool = false
//    @objc dynamic var isVIP = RealmOptional<Bool>(true)
    
    // Int, Int8, Int16, Int32, Int64
    @objc dynamic var id = 0 // Inferred as Int
    @objc dynamic var hairCount: Int64 = 0
    
    // Float, Double
    @objc dynamic var height: Float = 0.0
    @objc dynamic var weight = 0.0 // Inferred as Double
    
    
    // Compound property
    private let lat = RealmOptional<Double>()
    private let lng = RealmOptional<Double>()

    var lastLocation: CLLocation? {
        get {
            guard let lat = lat.value, let lng = lng.value else { return nil }
            return CLLocation(latitude: lat, longitude: lng)
        }
        set {
            guard let location = newValue?.coordinate else {
                lat.value = nil
                lng.value = nil
                return
            }

            lat.value = location.latitude
            lng.value = location.longitude
        }
    }
    
    @objc dynamic private var _department = Department.technology.rawValue
    
    var department: Department {
        get { return Department(rawValue: _department)! }
        set { _department = newValue.rawValue }
    }
    
    @objc dynamic var key = UUID().uuidString
    override static func primaryKey() -> String? {
        return "key"
    }
    
    override static func indexedProperties() -> [String] {
        return ["firstName", "lastName"]
    }
    
    // Computed Properties
    var isDecsead: Bool {
        return deceased != nil
    }
    
    var fullName: String {
        guard let last = lastName else { return firstName }
        return "\(firstName) \(last)"
    }
    
    convenience init(firstName: String, born: Date, id: Int) {
        self.init()
        self.firstName = firstName
        self.born = born
        self.id = id
    }
    
    let idPropertyName = "id"
    var temporaryId = 0
    
    @objc dynamic var temporaryUploadId = 0
    override static func ignoredProperties() -> [String] {
        return ["temporaryUploadId"]
    }
    
}

//let allowsPublication = RealmOptional<Bool>()
//let allowsPublication = RealmOptional<Bool>(true)

let person = Person(
    firstName: "Marin",
    born: Date(timeIntervalSince1970: 0),
    id: 1035
)
//This creates a new object named person. At this point person is not a managed Realm object (also known as a detached object).

person.hairCount = 1284639265974
person.isVIP = true
//As long as the object is not added to a specific Realm, you can modify its properties when and as often as you wish
    
print(type(of: person))                                 // object's type
print(type(of: person).primaryKey() ?? "no primay key") // object's pk
print(type(of: person).className())                     // class name
    
print(person)
    
let myPerson = realm.object(ofType: Person.self, forPrimaryKey: "C49BF227-F3B4-4F4B-AF6B-8962DB27D511")
```

```swift
@objcMembers class Article: Object {
    dynamic var id = 0
    dynamic var title: String?
}

Example.of("Using @objcMembers") {
    let article = Article()
    article.title = "New article about a famous person"

    print(article)
}

```
