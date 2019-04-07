import Foundation

// 2. Selection Sort O(n^2)
// - each scan select min and put it the left
// - swap
func selectionSort(_ arr: [Int]) -> [Int] {
  var arr = arr
  for i in 0 ..< arr.count {
    var min = i
    for j in i + 1 ..< arr.count {
      if arr[j] < arr[min] {
        min = j
      }
    }
    arr.swapAt(i, min)
  }
  return arr
}
