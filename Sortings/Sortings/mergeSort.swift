import Foundation

// 4. Merge Sort O(n log n)
// Space-Complexity O(n)
func mergeSort(_ arr: [Int]) -> [Int] {
  if arr.count <= 1 { return arr }
  let mid = arr.count / 2
  let left = mergeSort(Array(arr[0..<mid]))
  let right = mergeSort(Array(arr[mid...]))
  return merge(left, right)
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
  var i = 0, j = 0
  var merged: [Int] = []
  while i < left.count && j < right.count {
    if left[i] < right[j] {
      merged.append(left[i])
      i += 1
    } else {
      merged.append(right[j])
      j += 1
    }
  }
  if i == left.count {
    merged += right[j...];
  } else {
    merged += left[i...]
  }
  return merged
}
