import Foundation

func isBipartiteGraph(_ adjacencyList: [Int: [Int]]) -> Bool {
  var checks: [Set<Int>] = [[], []]
  for (vertex, _) in adjacencyList {
    if checks[0].contains(vertex) || checks[1].contains(vertex) { continue }
    let sets = bipartiteDepthFirstSearch(adjacencyList, vertex: vertex)
    checks[0] = checks[0].union(sets[0])
    checks[1] = checks[1].union(sets[1])
  }
  return checks[0].isDisjoint(with: checks[1])
}
