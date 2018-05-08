Predicates
==========

Predicate replacements
----------------------
#### ```[property == %d]```
- ```filter("age == %d", 30)``` replaces %d with 30 and matches if column called 'property' is equal to 30.
#### ```[%K == %d]```
- ```filter("%K == %d", "age", 30)``` replaces %K with 'age' and %d with 30 and matches if column 'age' equals 30.

Comparison operators (abbrev.)
------------------------------

#### [==]
- ```filter("firstName == 'John'")``` matches values ```equal to```.
#### [!=]
- ```filter("firstName != 'John'")``` matches values ```not equal to```.
#### [>, >=] 
- ```filter("age > 30"), filter("age >= 30")``` matches values ```greater than (or equal) to```.
#### [<, <=] 
- ```filter("age < 30"), filter("age <= 30")``` matches values ```less than (or equal) to```.
#### [IN] 
- ```filter("id IN [1, 2, 3]")``` matches value ```from a list of values```.
#### [BETWEEN] 
- ```filter("age BETWEEN {18, 68}")``` matches value ```in a range of values```.

Logic operators (abbrev.)
-------------------------
#### [AND] 
- ```filter("age == 26 AND firstName == 'John'")``` matches ```only if both conditions are fulfilled```.
#### [OR] 
- ```filter("age == 26 OR firstName == 'John'")``` matches ```if any of the conditions are fulfilled```.
#### [NOT] 
- ```filter("NOT firstName == 'John'")``` matches ```if the conditions is not fulfilled```.

String operators
----------------
#### [BEGINSWITH] 
- ```filter("firstName BEGINSWITH 'J'")``` matches ```if the firstName value starts with J```.
#### [CONTAINS] 
- ```filter("firstName CONTAINS 'J'")``` matches ```if the firstName value contains anywhere J```.
#### [ENDSWITH] 
- ```filter("lastName ENDSWITH 'er'")``` matches ```if the lastName value ends with er```.
#### [LIKE] 
- ```filter("lastName LIKE 'J*on'")``` matches ```if value starts with 'J', 
continues with any kind of sequence of symbols, and ends on 'on'```.

e.g. Johnson, Johansson, etc. 
##### In the search pattern
- a ```?``` matches ```one symbol``` of any kind.
- a ```*``` matches ```zero or more symbols```.
##### All operators above can be modified with ```[c]``` and ```[d]``` in the following ways: 
- ```CONTAINS[c]``` for case-insensitive matching,
- ```CONTAINS[d]``` to ignore diacritics (i.e. e, è, ê, ë are all considered to be the same character).

Aggregate operators and key-paths (abbrev.)
-------------------------------------------
#### [ANY]
- ```filter("ANY people.firstName == 'Frank'")``` matches 
```if at least one of the objects in the people list``` has a property firstName equal to 'Frank'.
#### [NONE]
- ```filter("NONE people.firstName == 'Frank'")``` matches ```if none of the objects in the people list``` has a firstName equal to 'Frank’.

#### [@count] 
- ```filter("people.@count == 2")``` matches objects whose people list contains exactly two elements.


Ref
---
Realm_Building_Modern_Swift_Apps_with_Realm_Database iBooks
