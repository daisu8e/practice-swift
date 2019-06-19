import Foundation

// Daisuke
func reverse(_ x: Int) -> Int {
  var isNegative = false
  if x < 0 {
    isNegative = true
  }
  return Int(String(String(abs(x)).reversed()))! * (isNegative ? -1 : 1)
}