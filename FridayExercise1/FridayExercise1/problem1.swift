import Foundation

func problem1() {
  let currentChannel = 100
  let targetChannel = Int(readLine() ?? "") ?? 0
  let failedButtonsNumber = Int(readLine() ?? "") ?? 0
  let failedButtons = (readLine() ?? "").split(separator: " ").map { Int($0) ?? 0 }

  solveRemoteController(
    startChannel: currentChannel,
    endChannel: targetChannel,
    failedButtonsNumber: failedButtonsNumber,
    failedButtons: failedButtons
  )
}

func solveRemoteController(startChannel: Int, endChannel: Int, failedButtonsNumber: Int, failedButtons: [Int]) {
  let diff = abs(startChannel - endChannel)
  let digits = String(endChannel).count
  if diff <= digits {
    print(diff)
    return
  }
  var negativeClosestChannel = findNegativeClosestChannel(channel: endChannel, failedButtons: failedButtons)
  var negativeDiff = endChannel - negativeClosestChannel
  var positiveClosestChannel = findPositiveClosestChannel(channel: endChannel, failedButtons: failedButtons, max: endChannel + negativeDiff)
  var positiveDiff = positiveClosestChannel - endChannel
  var negativeSteps = String(negativeClosestChannel).count + negativeDiff
  var positiveSteps = String(positiveClosestChannel).count + positiveDiff
  print(negativeSteps <= positiveSteps ? negativeSteps : positiveSteps)
}

func findNegativeClosestChannel(channel: Int, failedButtons: [Int]) -> Int {
  var result = channel
  while result >= 0 {
    var contains = false
    for n in String(result).characters.map({ Int(String($0))! }) {
      if failedButtons.contains(n) {
        contains = true
        break
      }
    }
    if !contains { return result }
    result -= 1
  }
  return result
}

func findPositiveClosestChannel(channel: Int, failedButtons: [Int], max: Int) -> Int {
  var result = channel
  while result < max {
    var contains = false
    for n in String(result).characters.map({ Int(String($0))! }) {
      if failedButtons.contains(n) {
        contains = true
        break
      }
    }
    if !contains { return result }
    result += 1
  }
  return result
}
