import Foundation

// Time Complexity: O(n)

/*
15
1 2
1 3
2 4
3 7
6 2
3 8
4 9
2 5
5 11
7 13
10 4
11 15
12 5
14 7
6
6 11
10 9
2 6
7 6
8 13
8 15
->
2
4
2
1
3
1
*/

func lowestCommonAncestor2() {

  let nodesNumber = Int(readLine()!)!
  var edges: [[Int]] = []
  for _ in 0..<(nodesNumber - 1) {
    edges.append(readLine()!.split(separator: " ").map{ Int($0)! })
  }

  var tree = Tree2(edges: edges)

  let pairsNumber = Int(readLine()!)!
  var pairs: [[Int]] = []
  for _ in 0..<pairsNumber {
    pairs.append(readLine()!.split(separator: " ").map{ Int($0)! })
  }

  for pair in pairs {
    var parent: Int?
    var a = pair[0]
    var b = pair[1]
    var setA: Set<Int> = [a]
    var setB: Set<Int> = [b]
    while true {
      a = tree.parent(a)
      setA.insert(a)
      if !setA.isDisjoint(with: setB) {
        parent = a
        break
      }

      b = tree.parent(b)
      setB.insert(b)
      if !setB.isDisjoint(with: setA) {
        parent = b
        break
      }
    }
    if let p = parent { print(p) }
  }

}

class Tree2 {

  static let root = 1

  var list: [Int: [Int]]
  var parent: [Int: Int]
  var depth: [Int: Int]

  init(edges: [[Int]]) {
    self.list = Tree2.parseAdjacencyList(edges)
    (self.parent, self.depth) = Tree2.parseInformation(self.list)
  }

  func parent(_ child: Int, _ offset: Int = 1) -> Int {
    var child = child
    for _ in 1...offset {
      child = parent[child]!
    }
    return child
  }

  private class func parseAdjacencyList(_ edges: [[Int]]) -> [Int: [Int]] {
    var result: [Int: [Int]] = [:]
    for edge in edges {
      let a = edge[0]
      let b = edge[1]
      result[a] = result[a] ?? []
      result[a]!.append(b)
      result[b] = result[b] ?? []
      result[b]!.append(a)
    }
    return result
  }

  private class func parseInformation(_ list: [Int: [Int]]) -> (parent: [Int: Int], depth: [Int: Int]) {
    var parent: [Int: Int] = [:]
    var depth: [Int: Int] = [:]
    var checks: Set<Int> = []
    var queue: [Int] = []

    depth[root] = 0
    queue.append(root)
    while !queue.isEmpty {
      let p = queue.removeFirst()
      for c in list[p]! {
        if checks.contains(c) { continue }
        checks.insert(c)
        parent[c] = p
        depth[c] = depth[p]! + 1
        queue.append(c)
      }
    }

    return (parent: parent, depth: depth)
  }

}