import Foundation

func adjacencyList(_ input: [[Int]]) -> [Int: [Int]] {
  let vertices = input.first![0]
  let edges = input.first![1]

  var result: [Int: [Int]] = [:]
  for vertex in 1 ... vertices { result[vertex] = [] }

  for edge in input[1...edges] {
    let a = edge[0]
    let b = edge[1]
    result[a]!.append(b)
    result[b]!.append(a)
  }

  return result
}
