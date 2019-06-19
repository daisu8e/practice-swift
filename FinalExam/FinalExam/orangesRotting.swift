import Foundation

// Daisuke
func orangesRotting(_ grid: [[Int]]) -> Int {
  return OrangeGrid(grid).rottenDays()
}

class OrangeGrid {

  enum Orange: Int {
    case no = 0
    case flesh = 1
    case rotten = 2
  }

  let move: [String: [String: Int]] = [
    "back":  ["x":  0, "y": -1],
    "right": ["x":  1, "y":  0],
    "front": ["x":  0, "y":  1],
    "left":  ["x": -1, "y":  0]
  ]

  var grid: [[Int]]

  init(_ grid: [[Int]]) {
    self.grid = grid
  }

  func rottenDays() -> Int {
    var days = 0
    while true {
      if areReady(grid) { break }
      if let it = nextMinute(grid) {
        grid = it
        days += 1
      } else {
        days = -1
        break
      }
    }
    return days
  }

  private func areReady(_ grid: [[Int]]) -> Bool {
    for row in grid {
      for box in row {
        if Orange(rawValue: box) == Orange.flesh { return false }
      }
    }
    return true
  }

  private func nextMinute(_ now: [[Int]]) -> [[Int]]? {
    var next = now
    var changed = false
    for (i, row) in now.enumerated() {
      for (j, box) in row.enumerated() {
        if Orange(rawValue: box) != Orange.rotten { continue }
        for (_, offset) in move {
          let y = i + offset["y"]!
          let x = j + offset["x"]!
          if !(0 <= y && y < now.count && 0 <= x && x < row.count) { continue }
          if Orange(rawValue: next[y][x]) != Orange.flesh { continue }
          next[y][x] = Orange.rotten.rawValue
          changed = true
        }
      }
    }
    return changed ? next : nil
  }
}
