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

  mutating func enqueue(_ e: T) {
    array.append(e)
  }

  mutating func dequeue() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeFirst()
    }
  }
}