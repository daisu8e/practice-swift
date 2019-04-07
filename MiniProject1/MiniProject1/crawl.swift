import Foundation

func crawl(_ path: String, level: Int = 0) -> [String: Int]? {
  do {
    let fileManager = FileManager.default

    var information = ["directories": 0, "files": 0]

    var contents = try fileManager.contentsOfDirectory(atPath: path)
    contents.sort()

    var layer = ""
    for _ in 0..<level { layer.append("│    ") }

    for content in contents {
      print(layer + (content == contents.last ? "└─ " : "├─ ") + content)

      let contentPath = "\(path)/\(content)"
      var isDirectory: ObjCBool = true
      fileManager.fileExists(atPath: contentPath, isDirectory: &isDirectory)
      if isDirectory.boolValue {
        information["directories"]! += 1
        if let children = crawl(contentPath, level: level + 1) {
          information["directories"]! += children["directories"]!
          information["files"]! += children["files"]!
        }
      } else {
        information["files"]! += 1
      }
    }
    if level == 0 { print("\n\(information["directories"]!) directories, \(information["files"]!) files") }
    return information

  } catch {
    print("Something is wrong...")
    return nil
  }
}

let argv = ProcessInfo.processInfo.arguments

if argv.count == 2 {
  crawl(argv[1])
} else {
  print("Give me a path")
}

