import Foundation

/*
7
1 6
6 3
3 5
4 1
2 4
4 7
->
4
6
1
3
1
4
*/

/*
12
1 2
1 3
2 4
3 5
3 6
4 7
4 8
5 9
5 10
6 11
6 12
->
1
1
2
3
3
4
4
5
5
6
6
*/

func whoIsMyParent() {
  let n = Int(readLine()!)!
  var edges: [[Int]] = []
  for _ in 0..<(n - 1) {
    edges.append(readLine()!.split(separator: " ").map{ Int($0)! })
  }

  let list = adjacencyList(edges)
  let root = 1
  var parent: [Int: Int] = [:]
  var checks: Set<Int> = []
  var queue: [Int] = []
  queue.append(root)
  while !queue.isEmpty {
    let p = queue.removeFirst()
    for c in list[p]! {
      if checks.contains(c) { continue }
      checks.insert(c)
      parent[c] = p
      queue.append(c)
    }
  }

  parent.sorted(by: { $0.0 < $1.0 }).filter({ $0.0 >= 2 }).forEach({ print($1) })
}