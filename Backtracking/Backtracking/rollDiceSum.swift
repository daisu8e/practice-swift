import Foundation

var counter = 0

func rollDiceSum(_ count: Int, _ total: Int, _ result: [Int] = []) -> [Int] {

  counter += 1

  var result = result
  if count == 0 {
    if result.reduce(0, { $0 + $1 }) == total { print(result) }
    return result
  }
  for n in 1...6 {
    result.append(n)
    result = rollDiceSum(count - 1, total, result)
    result.removeLast()
  }
  return result
}
