import Foundation

let argv = ProcessInfo.processInfo.arguments

if !argv[1].isEmpty {
  crawl(argv[1])
} else {
  print("Give me a path")
}

