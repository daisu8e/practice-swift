import Foundation

// Daisuke
func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
  var results: [Int] = []
  for number in stride(from: left, through: right, by: 1) {
    var isSelfDividingNumber = true
    for n in String(number).map({ Int(String($0))! }) {
      if n == 0 || number % n != 0 {
        isSelfDividingNumber = false
        break
      }
    }
    if isSelfDividingNumber { results.append(number) }
  }
  return results
}