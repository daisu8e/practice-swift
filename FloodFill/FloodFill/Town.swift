import Foundation

class Town {

  var map: [[Int]] = []
  var size: Int = 0
  var groupedMap: [[Int]]

  init(_ map: [[Int]]) {
    self.map = map
    self.size = map.count
    self.groupedMap = Array(repeating: Array(repeating: 0, count: size), count: size)
  }

  func analyze() {
    var groupNum = 0
    for y in 0..<size {
      for x in 0..<size {
        if map[y][x] == 0 { continue }
        if groupedMap[y][x] == 0 {
          groupNum += 1
          simpleBFS(x: x, y: y, groupNum: groupNum)
        }
      }
    }
    print(groupNum)

    var houses: [Int: Int] = [:]
    for n in 1...groupNum { houses[n] = 0 }
    for y in 0..<size {
      for x in 0..<size {
        if map[y][x] == 0 { continue }
        houses[groupedMap[y][x]]! += 1
      }
    }
    for number in houses.values.sorted() {
      print(number)
    }
  }

  private func simpleBFS(x: Int, y: Int, groupNum: Int) {
    var queue = Queue<(x: Int, y: Int)>()
    queue.enqueue((x: x, y: y))
    groupedMap[y][x] = groupNum
    while !queue.isEmpty {
      let p = queue.dequeue()!
      let points = [
        (x: p.x,     y: p.y - 1),
        (x: p.x + 1, y: p.y    ),
        (x: p.x,     y: p.y + 1),
        (x: p.x - 1, y: p.y    )
      ]
      for (x, y) in points {
        if !(0 <= x && x < size && 0 <= y && y < size) { continue }
        if map[y][x] == 1 && groupedMap[y][x] == 0 {
          queue.enqueue((x: x, y: y))
          groupedMap[y][x] = groupNum
        }
      }
    }
  }

}
