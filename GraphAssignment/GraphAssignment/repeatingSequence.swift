import Foundation

func repeatingSequence() {
  var result: [Int] = []
  let line = readLine()!.split(separator: " ").map({ Int($0)! })
  let first = line[0]
  let power = line[1]
  result.append(first)
  while true {
    let next = String(result.last!)
      .map({ Int(String($0))! })
      .map({ Int(pow(Double($0), Double(power))) })
      .reduce(0, +)
    if result.contains(next) {
      result.removeSubrange(result.firstIndex(of: next)!..<result.endIndex)
      break
    }
    result.append(next)
  }
  print(result.count)
}