import Foundation

/*
2
8
3 2 7 8 1 4 5 6
10
2 1 3 4 5 6 7 9 10 8
*/

func cyclicPermutation() {
  for input in inputCyclicPermutations() {
    print(connectedComponents(adjacencyList(input)))
  }
}

func inputCyclicPermutations() -> [[[Int]]] {
  var result: [[[Int]]] = []
  let cases = Int(readLine()!)!
  for _ in 0 ..< cases {
    let size = Int(readLine()!)!
    let vertices = size
    let edges = size
    let line1 = 1...vertices
    let line2 = readLine()!.split(separator: " ").map({ Int($0)! })
    result.append([[vertices, edges]] + Array(zip(line1, line2).map({ [$0, $1] })))
  }
  return result
}

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

func depthFirstSearch(_ adjacencyList: [Int: [Int]], vertex: Int = 1, result: [Int] = []) -> [Int] {
  var result = result
  result.append(vertex)
  for next in adjacencyList[vertex]! {
    if result.contains(next) { continue }
    result = depthFirstSearch(adjacencyList, vertex: next, result: result)
  }
  return result
}
