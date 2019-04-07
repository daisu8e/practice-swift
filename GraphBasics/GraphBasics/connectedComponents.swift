import Foundation

func connectedComponents(_ adjacencyList: [Int: [Int]]) -> Int {
  var result = 0
  var checks: Set<Int> = []
  for (vertex, _) in adjacencyList {
    if checks.contains(vertex) { continue }
    checks = checks.union(depthFirstSearch(adjacencyList, vertex: vertex))
    result += 1
  }
  return result
}