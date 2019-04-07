import Foundation

func power(_ base: Int, _ exponent: Int) -> Int {
  if exponent == 0 {
    return 1
  }
  return power(base, exponent - 1) * base
}
