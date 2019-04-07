import Foundation

/*
5
1 3 2 -1
2 4 4 -1
3 1 2 4 3 -1
4 2 4 3 3 5 6 -1
5 4 6 -1
->
11
*/

/*
8
1 3 2 -1
2 4 4 -1
3 1 2 4 3 6 2 -1
4 2 4 3 3 5 6 -1
5 4 6 -1
6 3 2 7 4 -1
7 6 4 8 5 -1
8 7 5 -1
->
20
*/

func diameter2() {
  let n = Int(readLine()!)!
  var adjList = [[Edge]](repeating: [], count: n + 1)
  var check = [Bool](repeating: false, count: n + 1)
  var distance = [Int](repeating: 0, count: n + 1)

  for _ in 1...n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let node = line[0]
    var j = 1
    while j < line.count-2 {
      let next = line[j]
      let dist = line[j+1]
      adjList[node].append(Edge(to: next, cost: dist))
      if line[j + 2] == -1 {
        break
      }
      j += 2
    }
  }

  bfsDiameter(start: 1, check: &check, dist: &distance, adjList: &adjList)
  var start = 1
  for i in 2...n {
    if distance[i] > distance[start] {
      start = i
    }
  }
  var check2 = [Bool](repeating: false, count: n + 1)
  var distance2 = [Int](repeating: 0, count: n + 1)
  bfsDiameter(start: start, check: &check2, dist: &distance2, adjList: &adjList)
  print(distance2.max()!)
}

struct Edge {
  let to: Int
  let cost: Int
}

func bfsDiameter(start: Int, check: inout [Bool], dist: inout [Int], adjList: inout [[Edge]]) {
  var queue: [Int] = []
  check[start] = true
  queue.append(start)
  while !queue.isEmpty {
    let x = queue.removeFirst()
    for i in 0..<adjList[x].count {
      let edge = adjList[x][i]
      if check[edge.to] == false {
        dist[edge.to] = dist[x] + edge.cost
        queue.append(edge.to)
        check[edge.to] = true
      }
    }
  }
}

