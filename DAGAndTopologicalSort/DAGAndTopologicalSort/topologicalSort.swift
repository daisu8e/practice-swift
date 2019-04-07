import Foundation

// TODO Refactoring

var indegrees: [Int] = [Int]()

func topologicalSort(adjList: inout [[Int]]) {
  let n = adjList.count - 1
  var queue: PriorityQueue<Int> = PriorityQueue<Int>(sort: <)
  for i in 1...n {
    if indegrees[i] == 0 {
      queue.enqueue(i)
    }
  }
  for _ in 0..<n {
    let x = queue.dequeue()! // dequeue the minimum order node
    print(x)
    for v in adjList[x] {
      indegrees[v] -= 1
      if indegrees[v] == 0 {
        queue.enqueue(v)
      }
    }
  }
}