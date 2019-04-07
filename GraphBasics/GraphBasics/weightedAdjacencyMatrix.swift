import Foundation

func weightedAdjacencyMatrix(_ adjacencyList: [Int: [(Int, Int)]]) -> [[Int]] {
  var result: [[Int]] = Array(repeating: Array(repeating: 0, count: adjacencyList.count), count: adjacencyList.count)

  for (vertex, edges) in adjacencyList {
    for edge in edges {
      result[vertex - 1][edge.0 - 1] = edge.1
    }
  }

  return result
}
