import Foundation

struct Queue<T> {
  var array = [T]()

  var count: Int {
    return array.count
  }

  var isEmpty: Bool {
    return array.isEmpty
  }

  var peek: T? {
    return array.first
  }
  // O(1)
  mutating func enqueue(_ e: T) {
    array.append(e)
  }
  // O(n)
  mutating func dequeue() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeFirst()
    }
  }
}