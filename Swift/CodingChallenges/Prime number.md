Number is prime
===============


```swift
// If the number n is not prime, it means it can be reached by multiplying two factors, x and y.
// ( 16 = 8 * 2 )
// If both of those numbers were greater than the square root of n, then x * y would be greater than n, which is not possible.
// So, we can be sure that at least one of x and y is less than or equal to the square root of n.
// ( 2 is smaller than 4 )

func challenge20a(number: Int) -> Bool {
  guard number >= 2 else { return false }
  guard number != 2 else { return true }
  
  let max = Int(ceil(sqrt(Double(number))))
  
  for i in 2...max {
    if number % i == 0 {
      return false
    }
  }
  
  return true
}

challenge20a(number: 8)
challenge20a(number: 16777259)
```
