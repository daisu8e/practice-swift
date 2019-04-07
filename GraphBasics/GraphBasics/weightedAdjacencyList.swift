import Foundation

func weightedAdjacencyList(_ input: [[Int]]) -> [Int: [(Int, Int)]] {
  let vertices = input.first![0]
  let edges = input.first![1]

  var result: [Int: [(Int, Int)]] = [:]
  for vertex in 1 ... vertices { result[vertex] = [] }

  for edge in input[1...edges] {
    let a = edge[0]
    let b = edge[1]
    let w = edge[2]
    result[a]!.append((b, w))
    result[b]!.append((a, w))
  }

  return result
}
