import Foundation

// 5. Quick Sort O(n log n)
// Space-Complexity O(1) (in-place)
func quickSort(_ arr: [Int]) -> [Int] {
  if arr.count <= 1 { return arr }
  let pivot: Int! = arr.last
  var i = 0
  var j = arr.count - 1
  var lower: [Int] = []
  var same: [Int] = []
  var higher: [Int] = []
  while true {
    if      arr[i] <  pivot { lower.append(arr[i]) }
    else if arr[i] == pivot { same.append(arr[i]) }
    else if arr[i] >  pivot { higher.append(arr[i]) }
    i += 1
    if i > j { break }

    if      arr[j] <  pivot { lower.append(arr[j]) }
    else if arr[j] == pivot { same.append(arr[j]) }
    else if arr[j] >  pivot { higher.append(arr[j]) }
    j -= 1
    if j < i { break }
  }
  return quickSort(lower) + same + quickSort(higher)
}

