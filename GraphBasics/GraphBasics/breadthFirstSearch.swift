import Foundation

func breadthFirstSearch(_ adjacencyList: [Int: [Int]], vertex: Int = 1) -> [Int] {
  var result: [Int] = []
  var queue: Queue<Int> = Queue<Int>()
  result.append(vertex)
  queue.enqueue(vertex)
  while !queue.isEmpty {
    let first = queue.dequeue()!
    for next in adjacencyList[first]! {
      if result.contains(next) { continue }
      result.append(next)
      queue.enqueue(next)
    }
  }
  return result
}

