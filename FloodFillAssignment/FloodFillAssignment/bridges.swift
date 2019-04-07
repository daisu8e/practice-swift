import Foundation

/*
10
1 1 1 0 0 0 0 1 1 1
1 1 1 1 0 0 0 0 1 1
1 0 1 1 0 0 0 0 1 1
0 0 1 1 1 0 0 0 0 1
0 0 0 1 0 0 0 0 0 1
0 0 0 0 0 0 0 0 0 1
0 0 0 0 0 0 0 0 0 0
0 0 0 0 1 1 0 0 0 0
0 0 0 0 1 1 1 0 0 0
0 0 0 0 0 0 0 0 0 0
-> 3
*/

/*
10
1 1 1 0 0 0 0 1 1 1
1 1 1 1 0 0 0 0 1 1
1 0 1 1 0 0 0 0 1 1
0 0 1 1 1 0 0 0 0 1
0 0 0 1 0 0 0 0 0 1
0 0 0 0 0 0 1 0 0 1
0 0 0 0 0 0 1 0 0 0
0 0 0 0 1 1 1 0 0 0
0 0 0 0 1 1 1 0 0 0
0 0 0 0 0 0 0 0 0 0
-> 2
*/

func bridges() {
  var map: [[Int]] = []
  let line1 = Int(readLine()!)!
  for _ in 0..<line1 {
    map.append(readLine()!.split(separator: " ").map({ Int($0)! }))
  }
  print(Islands(map).shortestBridges())
}

class Islands {

  private enum Grid: Int {
    case ocean = 0
    case land = 1
  }

  private let move: [String: [String: Int]] = [
    "back":  ["x":  0, "y": -1],
    "right": ["x":  1, "y":  0],
    "front": ["x":  0, "y":  1],
    "left":  ["x": -1, "y":  0]
  ]

  var map: [[Int]]

  private var islandsMap: [[Int]]?
  private var shortestBridgeLength: Int?

  init(_ map: [[Int]]) {
    self.map = map
  }

  func shortestBridges() -> Int {
    parseShortestBridgeLength()
    return shortestBridgeLength!
  }

  private func parseShortestBridgeLength() {
    if shortestBridgeLength != nil { return }
    shortestBridgeLength = 0
    if islandsMap == nil { createIslandsMap() }
    for (i, row) in islandsMap!.enumerated() {
      for (j, id) in row.enumerated() {
        if id == 0 { continue }
        breadthFirstSearchToParseShortestBridge((x: j, y: i, length: 0), id)
      }
    }
  }

  private func breadthFirstSearchToParseShortestBridge(_ point: (x: Int, y: Int, length: Int), _ id: Int) {
    var queue: [(x: Int, y: Int, length: Int)] = []
    queue.append(point)
    while !queue.isEmpty {
      let p = queue.removeFirst()
      var isEnd = false
      for (_, offset) in move {
        let y = p.y + offset["y"]!
        let x = p.x + offset["x"]!
        if !(0 <= y && y < islandsMap!.count && 0 <= x && x < islandsMap!.first!.count) { continue }
        if islandsMap![y][x] == id { continue }
        if islandsMap![y][x] != 0 {
          shortestBridgeLength = p.length
          isEnd = true
        } else {
          let length = p.length + 1
          if length > shortestBridgeLength! && shortestBridgeLength! >= 1 { continue }
          queue.append((x: x, y: y, length: length))
        }
      }
      if isEnd { return }
    }
  }

  private func createIslandsMap() -> [[Int]] {
    var id = 0
    islandsMap = map.map { $0.map { _ in id } }
    for (i, row) in map.enumerated() {
      for (j, grid) in row.enumerated() {
        if Grid(rawValue: grid) == .ocean { continue }
        if islandsMap![i][j] != 0 { continue }
        id += 1
        breadthFirstSearchToCreateIslandsMap((x: j, y: i), id)
      }
    }
    return islandsMap!
  }

  private func breadthFirstSearchToCreateIslandsMap(_ point: (x: Int, y: Int), _ id: Int) {
    var queue: [(x: Int, y: Int)] = []
    queue.append(point)
    islandsMap![point.y][point.x] = id
    while !queue.isEmpty {
      let p = queue.removeFirst()
      for (_, offset) in move {
        let y = p.y + offset["y"]!
        let x = p.x + offset["x"]!
        if !(0 <= y && y < islandsMap!.count && 0 <= x && x < islandsMap!.first!.count) { continue }
        if Grid(rawValue: map[y][x]) == .ocean { continue }
        if islandsMap![y][x] != 0 { continue }
        queue.append((x: x, y: y))
        islandsMap![y][x] = id
      }
    }
  }

}