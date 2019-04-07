import Foundation

func isPalindrome(_ word: String) -> Bool {
  if word.count <= 1 {
    return true
  }
  if let first = word.first, let last = word.last, first == last {
    return isPalindrome(String(word.dropFirst().dropLast()))
  }
  return false
}
