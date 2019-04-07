import Foundation

/*
7
A B C
B D .
C E F
E . .
F . G
D . .
G . .
*/

let asciiOfA = Int("A".unicodeScalars.first!.value)

func exercise1() {
  var tree: [Int: [Int]] = [:]
  let n = Int(readLine()!)!
  for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{ Character(String($0)) }
    let parent = Int(input[0].unicodeScalars.first!.value) - asciiOfA
    let children = [
      input[1] == "." ? -1 : Int(input[1].unicodeScalars.first!.value) - asciiOfA,
      input[2] == "." ? -1 : Int(input[2].unicodeScalars.first!.value) - asciiOfA
    ]
    tree[parent] = children
  }
  preorder(tree)
  print()
  inorder(tree)
  print()
  postorder(tree)
  print()
}

func preorder(_ tree: [Int: [Int]], node: Int = 0) {
  if node == -1 { return }
  print(Character(UnicodeScalar(node + asciiOfA)!), terminator: "")
  preorder(tree, node: tree[node]![0])
  preorder(tree, node: tree[node]![1])
}

func inorder(_ tree: [Int: [Int]], node: Int = 0) {
  if node == -1 { return }
  inorder(tree, node: tree[node]![0])
  print(Character(UnicodeScalar(node + asciiOfA)!), terminator: "")
  inorder(tree, node: tree[node]![1])
}

func postorder(_ tree: [Int: [Int]], node: Int = 0) {
  if node == -1 { return }
  postorder(tree, node: tree[node]![0])
  postorder(tree, node: tree[node]![1])
  print(Character(UnicodeScalar(node + asciiOfA)!), terminator: "")
}

