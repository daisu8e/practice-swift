import Foundation

/*
2
3 2   // N, M
1 3
2 3
4 4   // N, M
1 2
2 3
3 4
4 2
*/

/*
2
3 2
1 3
2 3
4 4
1 2
2 3
3 4
4 2
*/

func inputBipartiteGraphs() -> [[[Int]]] {
  var result: [[[Int]]] = []
  let cases = Int(readLine()!)!
  for i in 0 ..< cases {
    result.append([])
    while let line = readLine() {
      result[i].append(line.split(separator: " ").map({ Int($0)! }))
      if result[i].count >= result[i][0][1] + 1 {
        break
      }
    }
  }
  return result
}
