import Foundation

// Time Complexity: O(logn)

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

func lowestCommonAncestor3() {

  let nodesNumber = Int(readLine()!)!
  var edges: [[Int]] = []
  for _ in 0..<(nodesNumber - 1) {
    edges.append(readLine()!.split(separator: " ").map{ Int($0)! })
  }

  var tree = Tree3(edges: edges)

  // TODO Refactoring

  var parents: [Int: [Int]] = [:]

  for v in 1...nodesNumber {
    parents[v] = parents[v] ?? []
    parents[v]!.append(tree.parent[v]!)
  }
  var j = 1
  while (1<<j) < nodesNumber { // 2^j (j=1, ... ) < nodesNumber
    for v in 1...nodesNumber {
      if parents[v]![j-1] != 0 {
        parents[v]![j] = parents[parents[v]![j-1]]![j-1]
      }
    }
    j += 1
  }

  parents.forEach { print($0) }

  let pairsNumber = Int(readLine()!)!
  var pairs: [[Int]] = []
  for _ in 0..<pairsNumber {
    pairs.append(readLine()!.split(separator: " ").map{ Int($0)! })
  }

  for pair in pairs {
    print(lcaDP3(u: pair[0], v: pair[1], parents: parents, depth: tree.depth, parent: tree.parent))
  }

}

func lcaDP3(u: Int, v: Int, parents: [Int: [Int]], depth: [Int: Int], parent: [Int: Int]) -> Int {
  var u = u
  var v = v
  if depth[u]! < depth[v]! {
    swap(&u, &v)
  }
  var k = 1
  while (1<<k) <= depth[u]! {
    k += 1
  }
  k -= 1

  for i in stride(from: k, through: 0, by: -1) {
    if (depth[u]! - depth[v]!) >= (1<<i) {
      u = parents[u]![i]
    }
  }

  if u == v {
    return u
  } else {
    for i in stride(from: k, through: 0, by: -1) {
      if parents[u]![i] != 0 && parents[u]![i] != parents[v]![i] {
        u = parents[u]![i]
        v = parents[v]![i]
      }
    }
    return parent[u]!
  }
}

class Tree3 {

  static let root = 1

  var list: [Int: [Int]]
  var parent: [Int: Int]
  var depth: [Int: Int]

  init(edges: [[Int]]) {
    self.list = Tree3.parseAdjacencyList(edges)
    (self.parent, self.depth) = Tree3.parseInformation(self.list)
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

