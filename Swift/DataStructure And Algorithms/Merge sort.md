```swift
import Foundation

// Array-based merge sort
func mergeSort<T: Comparable>(_ list: [T]) -> [T] {
  if list.count < 2 {
    return list
  }
  
  let center = list.count / 2
  return merge(mergeSort([T](list[0..<center])), rightHalf: mergeSort([T](list[center..<list.count])))
}

func merge<T: Comparable>(_ leftHalf: [T], rightHalf: [T]) -> [T] {
  var result: [T] = [T]()
  
  var left = 0
  var right = 0
  
  result.reserveCapacity(leftHalf.count + rightHalf.count)
  
  while left < leftHalf.count && right < rightHalf.count {
    
    if leftHalf[left] < rightHalf[right] {
      result.append(leftHalf[left])
      left += 1
    } else if leftHalf[left] > rightHalf[right] {
      result.append(rightHalf[right])
      right += 1
    } else {
      result.append(leftHalf[left])
      result.append(rightHalf[right])
      left += 1
      right += 1
    }
  }
  
  result += [T](leftHalf[left..<leftHalf.count])
  result += [T](rightHalf[right..<rightHalf.count])
  
  return result
}

mergeSort([5, 6, 3, 2, 1, 3, 3, 3, 2, 5, 1, 1, 1, 1, 12, 2, 3, 4, 5, 6])
```
