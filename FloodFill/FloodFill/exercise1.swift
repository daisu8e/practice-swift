import Foundation

/*
7
0110100
0110101
1110101
0000111
0100000
0111110
0111000
*/

func exercise1() {
  var map: [[Int]] = []
  let size = Int(readLine()!)!
  for _ in 0..<size {
    map.append(readLine()!.map { Int(String($0))! })
  }
  Town(map).analyze()
}

