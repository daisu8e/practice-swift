import Foundation

/*
2
->
1
*/

/*
10
->
3
*/

func problem2() {
  let number = Int(readLine()!)!
  print(makeOne(number))
}

func makeOne(_ number: Int) -> Int {
  var results: [Int: Int] = [:]
  for n in 1...number {

    if n == 1 {
      results[n] = 0;
    } else {
      results[n] = results[n - 1]! + 1;
    }

    if n % 2 == 0 && results[n]! > results[n / 2]! + 1 {
      results[n] = results[n / 2]! + 1;
    }

    if n % 3 == 0 && results[n]! > results[n / 3]! + 1 {
      results[n] = results[n / 3]! + 1;
    }

  }
  return results[number]!;
}

