import Foundation

// 3. Insertion Sort O(n^2)
// - sorted | unsorted
// - inserting elem from unsorted portion into sorted portion
// - shift
func insertionSort(_ arr: [Int]) -> [Int] {
  var arr = arr
  for i in 1 ..< arr.count {
    let toInsert = arr[i]
    var j = i - 1
    while j >= 0 {
      if toInsert < arr[j] {
        arr[j + 1] = arr[i]
      } else {
        break
      }
      j -= 1
    }
    arr[j + 1] = toInsert
  }
  return arr
}
