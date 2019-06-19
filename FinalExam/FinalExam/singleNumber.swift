import Foundation

// Daisuke
func singleNumber(_ nums: [Int]) -> Int {
  var kvs: [Int: Int] = [:]
  for n in nums {
    kvs[n] = kvs[n] ?? 0
    kvs[n]! += 1
  }
  for (n, count) in kvs {
    if count == 1 { return n }
  }
  return 0
}