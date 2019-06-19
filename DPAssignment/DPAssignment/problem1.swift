import Foundation

/*
2
-> 2
*/

/*
3
-> 3
*/

func problem1() {
  let steps = Int(readLine()!)!
  print(climbingStairs(steps))
}

/*
n-1 ...+1
n-2 ...+2
*/
func climbingStairs(_ steps: Int) -> Int {
  var results: [Int: Int] = [:]
  for n in 1...steps {
    if n == 1 {
      results[n] = 1
    } else if n == 2 {
      results[n] = results[n - 1]! + 1
    } else {
      results[n] = results[n - 1]! + results[n - 2]!
    }
  }
  return results[steps]!
}