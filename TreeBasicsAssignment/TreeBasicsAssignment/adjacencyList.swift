import Foundation

func adjacencyList(_ edges: [[Int]]) -> [Int: [Int]] {
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
