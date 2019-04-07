import Foundation

/* 1 connected component graph
6 8
1 2
1 5
2 3
2 4
2 5
5 4
4 3
4 6
*/

/* 1 connected component weighted graph
6 8
1 2 2
1 5 7
2 3 2
2 4 3
2 5 1
5 4 7
4 3 1
4 6 7
*/

/* 2 connected components graph
6 5
1 2
2 5
5 1
3 4
4 6
*/

func inputGraph() -> [[Int]] {
  var result: [[Int]] = []
  while let line = readLine() {
    result.append(line.split(separator: " ").map({ Int($0)! }))
    if result.count >= result[0][1] + 1 { break }
  }
  return result
}