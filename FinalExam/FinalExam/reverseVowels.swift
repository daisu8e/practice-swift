import Foundation

// Daisuke
func reverseVowels(_ s: String) -> String {
  var s = Array(s)
  var vowels: [Character] = []
  var indexes: [Int] = []
  for (i, c) in s.enumerated() {
    if "aeiou".contains(c) {
      vowels.append(c)
      indexes.append(i)
    }
  }
  vowels.reverse()
  for (i, v) in vowels.enumerated() {
    s[indexes[i]] = v
  }
  return String(s)
}
