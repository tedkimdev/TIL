Cascading Inserts
=================

```swift
let newAuthor = Person()
newAuthor.firstName = "New"
newAuthor.lastName = "Author"

let article = Article()
article.author = newAuthor

try! realm.write {
  realm.add(article)
}
```

- ```article``` is added to Realm. Since it references ```newAuthor```, that object will also be added to the Realm.
