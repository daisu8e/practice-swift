import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var count = 0
func solveQueens(board: inout Board, row: Int = 0) -> Bool {
	count += 1

  var y = row
  for x in 0..<board.size {
    if !board.isSafe(row: y, col: x) { continue }
    board.place(row: y, col: x)
    if y == board.size - 1 {
      print(board.description)
      return true
    }
    if solveQueens(board: &board, row: y + 1) { return true }
    board.remove(row: y, col: x)
  }

  return false
}
