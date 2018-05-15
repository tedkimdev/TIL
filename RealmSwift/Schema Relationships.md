Schema Relationships
====================

```swift

import Foundation

import RealmSwift


class BrandCategory: Object {
  
  // MARK: - Properties
  @objc dynamic var id = UUID().uuidString
  @objc dynamic var name = ""
  @objc dynamic var country: String?
  
  let beverage = List<Beverage>() //To-many
  
  
  // MARK: - Init
  convenience init(_ name: String, country: String? = nil) {
    self.init()
    self.name = name
    self.country = country
  }
  
  
  // MARK: - Meta information
  override static func primaryKey() -> String? {
    return "id" // or "name"?
  }
  
}

```

```swift

import Foundation

import RealmSwift


class Beverage: Object {
  
  // MARK: - Properties
  @objc dynamic var id = UUID().uuidString
  @objc dynamic var name = ""
  @objc dynamic var ml = 0.0
  @objc dynamic var floz = 0.0
  @objc dynamic var caffeine = 0.0
  
  @objc dynamic var category: BrandCategory?  //To-one
  
  
  // MARK: - Init
  convenience init(_ name: String, ml: Double? = nil, floz: Double? = nil, caffeine: Double, category: BrandCategory?) {
    self.init()
    self.name = name
    
    if let ml = ml {
      self.ml = ml
    }
    
    if let floz = floz {
      self.floz = floz
    }
    
    self.caffeine = caffeine
    self.category = category
  }
  
  
  // MARK: - Meta information
  override static func primaryKey() -> String? {
    return "id" // or name?
  }
  
}

```


```swift
import Foundation

import RealmSwift


class ConsumeBeverage: Object {
  
  // MARK: - Properties
  @objc dynamic var id = UUID().uuidString
  @objc dynamic var date = Date()
  
  @objc dynamic var ml = 0.0
  @objc dynamic var floz = 0.0
  @objc dynamic var caffeine = 0.0
  
  @objc dynamic var beverage: Beverage? //To-one
  
  
  // MARK: - Init
  convenience init(_ beverage: Beverage) {
    self.init()
    self.beverage = beverage
    self.ml = beverage.ml
    self.floz = beverage.floz
    self.caffeine = beverage.caffeine
  }
  
  convenience init(caffeine: Double, ml: Double? = nil, floz: Double? = nil) {
    self.init()
    self.caffeine = caffeine
    if let ml = ml {
      self.ml = ml
    }
    
    if let floz = floz {
      self.floz = floz
    }
  }
  
  
  // MARK: - Meta information
  override static func primaryKey() -> String? {
    return "id"
  }
  
}
```
