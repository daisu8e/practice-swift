import Foundation

// Daisuke
func isBipartite(_ graph: [[Int]]) -> Bool {
  var checks: [Set<Int>] = [[], []]
  for (vertex, _) in graph.enumerated() {
    if checks[0].contains(vertex) || checks[1].contains(vertex) { continue }
    let sets = bipartiteDepthFirstSearch(graph, vertex: vertex)
    checks[0] = checks[0].union(sets[0])
    checks[1] = checks[1].union(sets[1])
  }
  return checks[0].isDisjoint(with: checks[1])
}

func bipartiteDepthFirstSearch(_ graph: [[Int]], vertex: Int = 1, set: Int = 0, result: [[Int]] = [[], []]) -> [[Int]] {
  let a = set
  let b = 1 - set
  var result = result
  result[a].append(vertex)
  for next in graph[vertex] {
    if result[b].contains(next) { continue }
    result = bipartiteDepthFirstSearch(graph, vertex: next, set: b, result: result)
  }
  return result
}

