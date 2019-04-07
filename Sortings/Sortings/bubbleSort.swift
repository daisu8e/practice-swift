import Foundation

// 1. Bubble Sort O(n^2)
// - too many swaps
// - bubble up the largest one to the right
func bubbleSort(_ arr: [Int]) -> [Int] {
  var arr = arr
  for i in 0 ..< arr.count {
    var swaps = 0
    for j in 0 ..< arr.count - i - 1 {
      if arr[j] > arr[j + 1] {
        arr.swapAt(j, j + 1)
        swaps += 1
      }
    }
    if swaps == 0 { break }
  }
  return arr
}
