import Foundation

// printBinary(2)    10
// printBinary(7)    111
// printBinary(12)   1100
// printBinary(42)   101010
// printBinary(-500) -111110100
func printBinary(_ num: Int) {
  if num < 0 {
    print("-", terminator: "")
    printBinary(-num)
    return
  }
  if num >= 2 {
    printBinary(num / 2)
    print(num % 2, terminator: "")
  } else {
    print(num, terminator: "")
  }
}
