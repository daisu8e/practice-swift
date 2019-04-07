import Foundation

func reverseLines(_ position: Int = 0) {
  let contents = try! String(contentsOfFile: "/Users/kat/Projects/CICCC/practice-swift/Recursion/Recursion/File.txt", encoding: .utf8)
  let lines = contents.split(separator: "\n")
  if position < lines.count {
    reverseLines(position + 1)
    print(lines[position])
  }
}
