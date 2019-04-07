import Foundation

/*
6 4
0 0 0 0 0 0
0 0 0 0 0 0
0 0 0 0 0 0
0 0 0 0 0 1
-> 8
*/

/*
6 4
0 -1 0 0 0 0
-1 0 0 0 0 0
0 0 0 0 0 0
0 0 0 0 0 1
-> -1
*/

/*
6 4
1 -1 0 0 0 0
0 -1 0 0 0 0
0 0 0 0 -1 0
0 0 0 0 -1 1
-> 6
*/

/*
5 5
-1 1 0 0 0
0 -1 -1 -1 0
0 -1 -1 -1 0
0 -1 -1 -1 0
0 0 0 0 0
-> 14
*/

/*
2 2
1 -1
-1 1
-> 0
*/

func tomatoFarm() {
  var boxes: [[Int]] = []
  let line1 = readLine()!.split(separator: " ").map({ Int($0)! })
  for _ in 0..<line1[1] {
    boxes.append(readLine()!.split(separator: " ").map({ Int($0)! }))
  }
  print(TomatoFarm(boxes).ripeningDays())
}

class TomatoFarm {

  enum Tomato: Int {
    case no = -1
    case unripe = 0
    case ripe = 1
  }

  let move: [String: [String: Int]] = [
    "back":  ["x":  0, "y": -1],
    "right": ["x":  1, "y":  0],
    "front": ["x":  0, "y":  1],
    "left":  ["x": -1, "y":  0]
  ]

  var boxes: [[Int]]

  init(_ boxes: [[Int]]) {
    self.boxes = boxes
  }

  func ripeningDays() -> Int {
    var days = 0
    while true {
      if areReady(boxes) { break }
      if let it = tomorrowBoxes(boxes) {
        boxes = it
        days += 1
      } else {
        days = -1
        break
      }
    }
    return days
  }

  private func areReady(_ boxes: [[Int]]) -> Bool {
    for row in boxes {
      for box in row {
        if Tomato(rawValue: box) == Tomato.unripe { return false }
      }
    }
    return true
  }

  private func tomorrowBoxes(_ today: [[Int]]) -> [[Int]]? {
    var tomorrow = today
    var changed = false
    for (i, row) in today.enumerated() {
      for (j, box) in row.enumerated() {
        if Tomato(rawValue: box) != Tomato.ripe { continue }
        for (_, offset) in move {
          let y = i + offset["y"]!
          let x = j + offset["x"]!
          if !(0 <= y && y < today.count && 0 <= x && x < row.count) { continue }
          if Tomato(rawValue: tomorrow[y][x]) != Tomato.unripe { continue }
          tomorrow[y][x] = Tomato.ripe.rawValue
          changed = true
        }
      }
    }
    return changed ? tomorrow : nil
  }
}

