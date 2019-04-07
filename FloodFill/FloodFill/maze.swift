import Foundation

// TODO Refactoring

func Maze() {
  let dx = [1, -1, 0, 0]
  let dy = [0, 0, 1, -1]

  let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
  let height = firstLine[0]
  let width = firstLine[1]
  var check = [[Bool]](repeating: [Bool](repeating: false, count: width), count: height)
  var grid = [[Int]]()

  for _ in 0..<height {
    grid.append(readLine()!.map { Int(String($0))! })
  }

  var queue = Queue<Pair>()
  check[0][0] = true
  queue.enqueue(Pair(x: 0, y: 0))
  while !queue.isEmpty {
    let next = queue.dequeue()!
    for i in 0..<4 {
      let nx = next.x + dx[i]
      let ny = next.y + dy[i]
      if 0 <= nx && nx < width && 0 <= ny && ny < height {
        if check[ny][nx] == false && grid[ny][nx] >= 1 {
          queue.enqueue(Pair(x: nx, y: ny))
          grid[ny][nx] = grid[next.y][next.x] + 1
          check[ny][nx] = true
        }
      }
    }
  }
  print(grid[height-1][width-1])
}