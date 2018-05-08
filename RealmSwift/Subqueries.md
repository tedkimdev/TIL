Subqueries
==========

Example
-------
```swift
let articlesAboutFrank = realm.objects(Article.self)
  .filter("""
    title != nil AND
    people.@count > 0 AND
    SUBQUERY(people, $person,
      $person.firstName BEGINSWITH %@ AND
      $person.born > %@).@count > 0
    """,
    "Frank",
    Date.distantPast
   )
```

```swift
SUBQUERY(people, $person, <predicate>)
```
```The first parameter``` specifies ```the people collection``` you run the predicate on,

```the second``` assigns ```a variable name $person``` to use while looping over the collection, 

and ```the third``` is ```a predicate```.
