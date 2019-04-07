import Foundation

// TODO Refactoring

class Islands {

  struct Pair {
    let x: Int
    let y: Int
  }

  let dx = [0, 0, 1, -1, 1, 1, -1, -1]
  let dy = [1, -1, 0, 0, 1, -1, 1, -1]
  var group = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: 50), count: 50)

  func bfs(x: Int, y: Int, groupNum: Int, width: Int, height: Int, islandMap: inout [[Int]]) {
    var q = Queue<Pair>()
    q.enqueue(Pair(x: x, y: y))
    group[y][x] = groupNum
    while !q.isEmpty {
      let first = q.dequeue()!
      let x = first.x
      let y = first.y
      for i in 0..<8 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        if nx >= 0 && nx < width && ny >= 0 && ny < height {
          if islandMap[ny][nx] == 1 && group[ny][nx] == 0 {
            q.enqueue(Pair(x: nx, y: ny))
            group[ny][nx] = groupNum
          }
        }
      }
    }
  }

  func Islands() {
    while true {
      let firstLine = readLine()!
      if firstLine == "0 0" { break }
      var islandMap = [[Int]]()
      let firstLineArr = firstLine.split(separator: " ").map { Int(String($0))! }
      let w = firstLineArr[0]
      let h = firstLineArr[1]
      for _ in 0..<h {
        islandMap.append(readLine()!.split(separator: " ").map { Int(String($0))! })
      }
      var groupNum = 0
      for i in 0..<h {
        for j in 0..<w {
          if islandMap[i][j] == 1 && group[i][j] == 0 {
            groupNum += 1
            bfs(x: j, y: i, groupNum: groupNum, width: w, height: h, islandMap: &islandMap)
          }
        }
      }
      print(groupNum)
      group = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: 50), count: 50)
    }
  }
}