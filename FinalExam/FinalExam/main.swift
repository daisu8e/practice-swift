import Foundation

func point1Problem1() {
  /*
  Example:
    Input: [0,1,0,3,12]
    Output: [1,3,12,0,0]
  */
  print("point1Problem1 : moveZeroes ----------")
  var nums = [0,1,0,3,12]
  moveZeroes(&nums)
  print(nums)
}

func point1problem2() {
  /*
  Example 1:
    Input: [2,2,1]
    Output: 1

  Example 2:
    Input: [4,1,2,1,2]
    Output: 4
  */
  print("point1problem2 : singleNumber ----------")
  let nums = [2,2,1]
  print(singleNumber(nums))
}

func point1Problem3() {
  /*
  Example:
    Input: [0,1,0,3,12]
    Output: [1,3,12,0,0]
  */
  /*
  Example:

    n = 15,

    Return:
    [
        "1",
        "2",
        "Fizz",
        "4",
        "Buzz",
        "Fizz",
        "7",
        "8",
        "Fizz",
        "Buzz",
        "11",
        "Fizz",
        "13",
        "14",
        "FizzBuzz"
    ]
  */
  print("point1Problem3 5 : fizzBuzz ----------")
  var n = 15
  print(fizzBuzz(n))
}

func point1Problem5() {
  /*
  Example 1:
    Input: 123
    Output: 321

  Example 2:
    Input: -123
    Output: -321

  Example 3:
    Input: 120
    Output: 21
  */
  print("point1Problem5 : reverse ----------")
  let n = 120
  print(reverse(n))
}

func point1Problem6() {
  /*
  Example 1:
    Input:
    left = 1, right = 22
    Output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 15, 22]
  */
  print("point1Problem6 : selfDividingNumbers ----------")
  let left = 1
  let right = 22
  print(selfDividingNumbers(left, right))
}

func point1Problem7() {
  /*
  Example:

    Input:
    s = "abcd"
    t = "abcde"

    Output:
    e

    Explanation:
    'e' is the letter that was added.
  */
  print("point1Problem7 : findTheDifference ----------")
  let s = "abcd"
  let t = "abcde"
  print(findTheDifference(s, t))
}

func point1Problem8() {
  /*
  Example:

    Input:
    [4,3,2,7,8,2,3,1]

    Output:
    [5,6]
  */
  print("point1Problem8 : findDisappearedNumbers ----------")
  let nums = [4,3,2,7,8,2,3,1]
  print(findDisappearedNumbers(nums))
}

func point1Problem9() {
  /*
  Example 1:
    Input: ["h","e","l","l","o"]
    Output: ["o","l","l","e","h"]

  Example 2:
    Input: ["H","a","n","n","a","h"]
    Output: ["h","a","n","n","a","H"]
  */
  print("point1Problem9 : reverseString ----------")
  var s: [Character] = ["H","a","n","n","a","h"]
  reverseString(&s)
  print(s)
}

func point2Problem3() {
  /*
  Example 1:
    Input: "hello"
    Output: "holle"

  Example 2:
    Input: "leetcode"
    Output: "leotcede"
  */
  print("point2Problem3 : reverseVowels ----------")
  var s = "leetcode"
  print(reverseVowels(s))
}

func point3Problem1() {
  /*
  Example 1:
    Input: [[2,1,1],[1,1,0],[0,1,1]]
    Output: 4

  Example 2:
    Input: [[2,1,1],[0,1,1],[1,0,1]]
    Output: -1
    Explanation:  The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.

  Example 3:
    Input: [[0,2]]
    Output: 0
    Explanation:  Since there are already no fresh oranges at minute 0, the answer is just 0.
  */
  print("point3Problem1 : orangesRotting ----------")
  var grid = [[0,2]]
  print(orangesRotting(grid))
}

func point4Problem1() {
  /*
  Example 1:
    Input: [[1,3], [0,2], [1,3], [0,2]]
    Output: true
    Explanation:
    The graph looks like this:
    0----1
    |    |
    |    |
    3----2
    We can divide the vertices into two groups: {0, 2} and {1, 3}.

  Example 2:
    Input: [[1,2,3], [0,2], [0,1,3], [0,2]]
    Output: false
    Explanation:
    The graph looks like this:
    0----1
    | \  |
    |  \ |
    3----2
    We cannot find a way to divide the set of nodes into two independent subsets.
  */
  print("point4Problem1 : isBipartite ----------")
  var graph = [[1,2,3], [0,2], [0,1,3], [0,2]]
  print(isBipartite(graph))
}
point4Problem1()
