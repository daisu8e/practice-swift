import Foundation

/*
2
-> 2
*/

/*
9
-> 55
*/

func problem3() {
  let number = Int(readLine()!)!
  print(tiles2xN(number))
}

/*
n-1 ....a
    ....a

n-2 ...aa
    ...bb
*/
func tiles2xN(_ number: Int) -> Int {
  var results: [Int: Int] = [:]
  for n in 1...number {
    if n == 1 {
      results[n] = 1
    } else if n == 2 {
      results[n] = results[n - 1]! + 1
    } else {
      results[n] = results[n - 1]! + results[n - 2]!
    }
  }
  return results[number]!
}