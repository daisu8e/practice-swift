import Foundation

func depthFirstSearch(_ adjacencyList: [Int: [Int]], vertex: Int = 1, result: [Int] = []) -> [Int] {
  var result = result
  result.append(vertex)
  for next in adjacencyList[vertex]! {
    if result.contains(next) { continue }
    result = depthFirstSearch(adjacencyList, vertex: next, result: result)
  }
  return result
}

