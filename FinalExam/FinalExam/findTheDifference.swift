import Foundation

// Daisuke
func findTheDifference(_ s: String, _ t: String) -> Character {
  return Set(t).subtracting(Set(s)).first!
}