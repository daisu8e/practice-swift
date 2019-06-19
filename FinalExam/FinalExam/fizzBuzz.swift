import Foundation

// Daisuke
func fizzBuzz(_ number: Int) -> [String] {
  var result: [String] = []
  for n in 1...number {
    var s = ""
    if n % 3 == 0 { s.append("Fizz") }
    if n % 5 == 0 { s.append("Buzz") }
    if s.isEmpty { s = String(n) }
    result.append(s)
  }
  return result
}