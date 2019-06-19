import Foundation

/*
1
-> 10
*/

/*
2
-> 55
*/

/*
3
-> 220
*/

func problem7() {
  let digits = Int(readLine()!)!
  print(nonDecreasingDigits(digits))
}

/*
0
1
2
3
4
5
6
7
8
9

00
01
02
03
04
05
06
07
08
09
11
12
13
14
15
16
17
18
19
22
23
24
25
26
27
28
29
33
34
35
36
37
38
39
44
45
46
47
48
49
55
56
57
58
59
66
67
68
69
77
78
79
88
89
99

d/n 0 1 2 3 4 5 6 7 8 9
1   1 1 1 1 1 1 1 1 1 1
2  10 9 8 7 6 5 4 3 2 1
*/
func nonDecreasingDigits(_ digits: Int) -> Int {
  var results: [Int: [Int: Int]] = [:]
  for d in 1...digits {
    results[d] = [:]
    for n in 0...9 {
      if d == 1 {
        results[d]![n] = 1
      } else {
        results[d]![n] = results[d - 1]!.filter({ $0.key >= n }).reduce(0, { $0 + $1.value })
      }
    }
  }
  return results[digits]!.reduce(0, { $0 + $1.value });
}