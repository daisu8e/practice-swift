import Foundation

// TODO Bug fix

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

func diameter() {
  let root = 1

  let n = Int(readLine()!)!
  var lines: [[Int]] = []
  for _ in 0..<n {
    lines.append(readLine()!.split(separator: " ").map{ Int($0)! })
  }

  var tree: [Int: [(v: Int, d: Int)]] = [:]
  var queue: [Int] = []
  queue.append(root)
  while !queue.isEmpty {
    let parent = queue.removeFirst()
    for (i, line) in lines.enumerated() {
      if line.first != parent { continue }
      var edges = line.dropFirst().dropLast()
      while !edges.isEmpty {
        let vertex = edges.removeFirst()
        let distance = edges.removeFirst()
        if tree.keys.contains(vertex) { continue }
        tree[parent] = tree[parent] ?? []
        tree[parent]!.append((v: vertex, d: distance))
        queue.append(vertex)
      }
      lines.remove(at: i)
    }
    if lines.isEmpty { break }
  }

  print(tree)

  var diameter = tree.reduce(0){ $0 + $1.value.map{ $0.d }.max()! }
  print(diameter)
}