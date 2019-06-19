import Foundation

/*
5
-> True
*/

/*
3
-> False
*/

func problem9() {
  var number = Int(readLine()!)!
  print(sumOfSquareNumbers(number) ? "True" : "False")
}

/*
1^2 + 1^2 = 2
1^2 + 2^2 = 5
2^2 + 2^2 = 8
1^2 + 3^2 = 10
2^2 + 3^2 = 13
3^2 + 3^2 = 18
*/
func sumOfSquareNumbers(_ c: Int) -> Bool {
  for a in 0...c {
    let bb = c - (a * a)
    if bb < 0 { return false }

    let b = Double(bb).squareRoot()
    if b == b.rounded(.down) { return true }
  }
  return false
}

