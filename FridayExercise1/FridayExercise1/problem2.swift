import Foundation

func problem2() {
  var line = ""
  var patterns: [[Int]] = []
  while true {
    line = readLine() ?? "0"

    if line == "0" {
      for numbers in patterns {
        solveLotto(6, numbers)
        print()
      }
      return
    }

    let input = line.split(separator: " ").map({ Int($0) ?? -1 })
    let count = input[0]
    let numbers = Array(input[1...]).sorted()

    if !(6 < count && count < 13) {
      print("First number k must be 6 < k < 13")
      continue
    }

    if numbers.count != count {
      print("Count of numbers is not equal first number")
      continue
    }

    if numbers.filter({ !(1 <= $0 && $0 <= 49) }).count > 0 {
      print("Numbers must consist of 1 ~ 49")
    }

    patterns.append(numbers)
  }
}

func solveLotto(_ digits: Int, _ numbers: [Int], _ result: [Int] = []) {

  var result = result

  if result.count == digits {
    print(result.map({ String($0) }).joined(separator: " "))
    return
  }

  for (i, v) in numbers.enumerated() {
    result.append(v)
    solveLotto(digits, Array(numbers[(i + 1)...]), result)
    result.removeLast()
  }

}

