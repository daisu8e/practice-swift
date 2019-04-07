import Foundation

/*
5
8
1 2 2
1 3 3
1 4 1
1 5 10
2 4 2
3 4 1
3 5 1
4 5 3
1 5
->
4
*/

func dijkstraExercise() {
  let vertices = Int(readLine()!)!
  let edges = Int(readLine()!)!
  var lines: [[Int]] = []
  for _ in 0..<edges {
    lines.append(readLine()!.split(separator: " ").map{ Int($0)! })
  }

  let adjacencyList = adjacencyDirectedWeightedList(lines)

  let question = readLine()!.split(separator: " ").map{ Int($0)! }
  let start = question[0]
  let end = question[1]

  let result = dijkstra(vertices, adjacencyList, start, end)
  print(result)
}

func dijkstra(_ vertices: Int, _ adjacencyList: [Int: [(v: Int, w: Int)]], _ start: Int, _ end: Int) -> Int {
  let infinity = Int.max
  var distance: [Int: Int] = [:]
  for v in 1...vertices { distance[v] = v == start ? 0 : infinity }

  var queue = distance
  while !queue.isEmpty {
    let min = queue.min { $0.value < $1.value }
    if min!.key == end { break }
    queue.removeValue(forKey: min!.key)
    for (v, w) in adjacencyList[min!.key]! {
      let total = min!.value + w
      if total < distance[v]! {
        distance[v]! = total
        queue[v]! = total
      }
    }
  }

  return distance[end]!
}

func adjacencyDirectedWeightedList(_ edges: [[Int]]) -> [Int: [(v: Int, w: Int)]] {
  var result: [Int: [(v: Int, w: Int)]] = [:]
  for edge in edges {
    let u = edge[0]
    let v = edge[1]
    let w = edge[2]
    result[u] = result[u] ?? []
    result[u]!.append((v: v, w: w))
  }
  return result
}
