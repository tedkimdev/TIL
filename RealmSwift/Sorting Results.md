Sorting Results
===============

```swift
let sortedPeople = realm.objects(Person.self)
  .filter("firstName BEGINSWITH %@", "J")
  .sorted(byKeyPath: "firstName")
```

```swift
let sortedPeopleMultiple = realm.objects(Person.self)
  .sorted(by: [
    SortDescriptor(keyPath: "firstName", ascending: true),
    SortDescriptor(keyPath: "born", ascending: false)
  ])
```
