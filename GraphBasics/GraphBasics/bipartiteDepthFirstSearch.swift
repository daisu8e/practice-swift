import Foundation

func bipartiteDepthFirstSearch(_ adjacencyList: [Int: [Int]], vertex: Int = 1, set: Int = 0, result: [[Int]] = [[], []]) -> [[Int]] {
  let a = set
  let b = 1 - set
  var result = result
  result[a].append(vertex)
  for next in adjacencyList[vertex]! {
    if result[b].contains(next) { continue }
    result = bipartiteDepthFirstSearch(adjacencyList, vertex: next, set: b, result: result)
  }
  return result
}

//func bipartiteDepthFirstSearch(_ adjacencyList: [Int: [Int]], vertex: Int = 1, color: Int, check: inout [Int: Int]) {
//  check[vertex] = color
//  for next in adjacencyList[vertex]! {
//    if check[next] == 0 {
//      bipartiteDepthFirstSearch(adjacencyList, vertex: next, color: 3-color, check: &check)
//    }
//  }
//}
