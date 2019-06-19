import Foundation

/*
[10,9,2,5,3,7,101,18]
-> 4
*/

func problem8() {
  let numbers = String(readLine()!.dropFirst().dropLast()).split(separator: ",").map({ Int($0)! })
  print(longestIncreasingSubsequence(numbers))
}

/*
i        0 1 2 3 4 5   6  7
numbers 10 9 2 5 3 7 101 18
results  1 1 1 2 2 3   4  4
*/
func longestIncreasingSubsequence(_ numbers: [Int]) -> Int {
  var results = numbers.map { _ in 1 }
  for i in 0..<numbers.count {
    for j in 0..<i {
      if numbers[j] < numbers[i] && results[i] < results[j] + 1 {
        results[i] = results[j] + 1
      }
    }
  }
  return results.max()!
}

