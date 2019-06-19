import Foundation

/*
2
-> 3
*/

/*
8
-> 171
*/

/*
12
-> 2731
*/

func problem4() {
  let number = Int(readLine()!)!
  print(tiles2xN2(number))
}

/*
n-1 ....a
    ....a

n-2 ...aa
    ...bb

n-2 ...aa
    ...aa
*/
func tiles2xN2(_ number: Int) -> Int {
  var results: [Int: Int] = [:]
  for n in 1...number {
    if n == 1 {
      results[n] = 1
    } else if n == 2 {
      results[n] = results[n - 1]! + 1 + 1
    } else {
      results[n] = results[n - 1]! + results[n - 2]! + results[n - 2]!
    }
  }
  return results[number]!
}
