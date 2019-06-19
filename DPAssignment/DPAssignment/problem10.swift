import Foundation

/*
7
-> 4
*/

/*
11
-> 3
*/

func problem10() {
  let number = Int(readLine()!)!
  print(sumOfSquareNumbers2(number))
}

/*
 n
 1 1^2
 2 1^2 + 1^2
 3 1^2 + 1^2 + 1^2
 4 2^2
 5 2^2 + 1^2
 6 2^2 + 1^2 + 1^2
 7 2^2 + 1^2 + 1^2 + 1^2
 8 2^2 + 2^2
 9 3^2
10 3^2 + 1^2
11 3^2 + 1^2 + 1^2
12 3^2 + 1^2 + 1^2 + 1^2
13 3^2 + 2^2
14 3^2 + 2^2 + 1^2
15 3^2 + 2^2 + 1^2 + 1^2
16 4^2
17 4^2 + 1^2
18 3^2 + 3^2
19 3^2 + 3^2 + 1^2
20 4^2 + 2^2
21 4^2 + 2^2 + 1^2
22 3^2 + 3^2 + 2^2

d[n] = min(d[n - x^2] + 1) where 1 <= x <= square root of n
*/
func sumOfSquareNumbers2(_ number: Int) -> Int {
  var results: [Int: Int] = [:]
  for n in 1...number {
    let sqrtN = Double(n).squareRoot()
    if sqrtN == sqrtN.rounded(.down) {
      results[n] = 1
      continue
    }

    results[n] = results[n - 1]! + 1
    for x in 1...Int(Double(n).squareRoot()) {
      if results[n]! > results[n - (x * x)]! + 1 {
        results[n] = results[n - (x * x)]! + 1
      }
    }
  }
  return results[number]!
}

