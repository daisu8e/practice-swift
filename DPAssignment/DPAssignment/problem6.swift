import Foundation

/*
1
-> 9
*/

/*
2
-> 17
*/

/*
3
-> 32
*/

/*
5
-> 116
*/

/*
10
-> 2986
*/

func problem6() {
  let digits = Int(readLine()!)!
  print(prettyNumbers(digits))
}

/*
1
2
3
4
5
6
7
8
9

10
12
21
23
32
34
43
45
54
56
65
67
76
78
87
89
98

d/n 0 1 2 3 4 5 6 7 8 9
1   0 1 1 1 1 1 1 1 1 1
2   1 1 2 2 2 2 2 2 2 1
*/
func prettyNumbers(_ digits: Int) -> Int {
  var results: [Int: [Int: Int]] = [:]
  for d in 1...digits {
    results[d] = [:]
    for n in 0...9 {
      results[d]![n] = 0
      if d == 1 {
        if 1 <= n && n <= 9 {
          results[d]![n] = 1
        }
      } else {
        if 0 <= n && n <= 8 {
          results[d]![n]! += results[d - 1]![n + 1]!
        }
        if 1 <= n && n <= 9 {
          results[d]![n]! += results[d - 1]![n - 1]!
        }
      }
    }
  }
  return results[digits]!.reduce(0, { $0 + $1.value });
}
