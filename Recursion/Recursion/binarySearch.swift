import Foundation

func binarySearch(_ arr: [Int], _ target: Int) -> Int {
  var lower = 0
  var upper = arr.count - 1
  while lower <= upper {
    let mid = (lower + upper) / 2
    if arr[mid] == target {
      return mid
//    } else if {

    }

  }
}