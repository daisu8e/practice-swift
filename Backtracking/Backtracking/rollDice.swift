import Foundation

func rollDice(_ count: Int, _ result: [Int] = []) -> [Int] {
  var result = result
  if count == 0 {
    print(result)
    return result
  }
  for n in 1...6 {
    result.append(n)
    result = rollDice(count - 1, result)
    result.removeLast()
  }
  return result
}