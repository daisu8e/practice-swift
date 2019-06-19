import Foundation

// Daisuke
func moveZeroes(_ nums: inout [Int]) {
  nums = nums.filter({ $0 != 0 }) + nums.filter({ $0 == 0 })
}