import Foundation

// Daisuke
func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
  var results: [Int] = []
  var numbers = Array(Set(nums)).sorted()
  for n in stride(from: numbers.first!, through: numbers.last!, by: 1) {
    if !numbers.contains(n) { results.append(n) }
  }
  return results
}