import Foundation

func LCAOlogn() {
  let n = Int(readLine()!)!
  var adj = [[Int]](repeating: [], count: n + 1)
  var check = [Bool](repeating: false, count: n + 1)
  var depth = [Int](repeating: 0, count: n + 1)
  var parent = [Int](repeating: 0, count: n + 1)
  var p = [[Int]](repeating: [Int](repeating: 0, count: 18), count: n + 1)

  for _ in 0..<n-1 {
    let edge = readLine()!.split(separator: " ").map{ Int($0)! }
    let u = edge[0]
    let v = edge[1]
    adj[u].append(v)
    adj[v].append(u)
  }
  depth[1] = 0
  check[1] = true
  var queue: [Int] = []
  queue.append(1)
  parent[1] = 0
  while !queue.isEmpty {
    let x = queue.removeFirst()
    for v in adj[x] {
      if !check[v] {
        depth[v] = depth[x] + 1
        check[v] = true
        parent[v] = x
        queue.append(v)
      }
    }
  }

  for i in 1...n {
    p[i][0] = parent[i]
  }
  var j = 1
  while (1<<j) < n { // 2^j (j=1, ... ) < n
    for i in 1...n {
      if p[i][j-1] != 0 {
        p[i][j] = p[p[i][j-1]][j-1]
      }
    }
    j += 1
  }

  var m = Int(readLine()!)!
  while m > 0 {
    let edge = readLine()!.split(separator: " ").map{ Int($0)! }
    print(lcaDP(u: edge[0], v: edge[1], p: &p, depth: &depth, parent: &parent))
    m -= 1
  }
}

func lcaDP(u: Int, v: Int, p: inout [[Int]], depth: inout [Int], parent: inout [Int]) -> Int {
  var u = u
  var v = v
  if depth[u] < depth[v] {
    swap(&u, &v)
  }
  var k = 1
  while (1<<k) <= depth[u] {
    k += 1
  }
  k -= 1

  for i in stride(from: k, through: 0, by: -1) {
    if (depth[u] - depth[v]) >= (1<<i) {
      u = p[u][i]
    }
  }

  if u == v {
    return u
  } else {
    for i in stride(from: k, through: 0, by: -1) {
      if p[u][i] != 0 && p[u][i] != p[v][i] {
        u = p[u][i]
        v = p[v][i]
      }
    }
    return parent[u]
  }
}

