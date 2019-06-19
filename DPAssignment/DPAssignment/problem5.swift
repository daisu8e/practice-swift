import Foundation

/*
3
4
7
10
->
7
44
274
*/

func problem5() {
  let lines = Int(readLine()!)!
  for _ in 0..<lines {
    let number = Int(readLine()!)!
    print(oneTwoThree(number))
  }
}

/*
n-1 ...+1
n-2 ...+2
n-3 ...+3
*/
func oneTwoThree(_ number: Int) -> Int {
  var results: [Int: Int] = [:]
  for n in 1...number {
    if n == 1 {
      results[n] = 1
    } else if n == 2 {
      results[n] = results[n - 1]! + 1
    } else if n == 3 {
      results[n] = results[n - 1]! + results[n - 2]! + 1
    } else {
      results[n] = results[n - 1]! + results[n - 2]! + results[n - 3]!
    }
  }
  return results[number]!
}

