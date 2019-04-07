import Foundation

print("\nExercise 1 ------------------------------\n");
let nounArray = ["puppy", "laptop", "ocean","app", "cow", "skateboard", "developer", "coffee", "moon"]
let index1 = Int(arc4random() % 9)
let index2 = Int(arc4random() % 9)
let yourSentence = "The \(nounArray[0]) likes \(nounArray[7]) a lot."
let yourSillySentence = "The \(nounArray[index1]) is eating \(nounArray[index2])."
print(yourSentence)
print(yourSillySentence)

print("\nExercise 2 ------------------------------\n");
let didYouKnowString = "Did you know that the Swift String class comes with lots of useful methods?"
let whisperString = "psst, " + didYouKnowString.lowercased()
let shoutString =  "HEY! " + didYouKnowString.uppercased()
print(whisperString)
print(shoutString)

print("\nExercise 3 ------------------------------\n");
let howManyCharacters = "How much wood could a woodchuck chuck if a woodchuck could chuck wood?"
print(String(howManyCharacters.count) + " characters")

print("\nExercise 4 ------------------------------\n");
let gString = "Gary's giraffe gobbled gooseberries greedily"
var count = 0
for character in gString {
  if character == "G" || character == "g" { count += 1 }
}
print(String(count) + " of G or g")

print("\nExercise 5 ------------------------------\n");
let word = "fortunate"
if word.contains("tuna") {
  print("This string contains the substring \"tuna\".")
} else {
  print("This string does not contain the substring \"tuna\".")
}

print("\nExercise 6 ------------------------------\n");
let lottaLikes = "If like, you wanna learn Swift, like, you should build lots of small apps, cuz it's like, a good way to practice."
print(lottaLikes.replacingOccurrences(of: "like, ", with: ""))

print("\nExercise 7 ------------------------------\n");
let sillyMonkeyString = "A monkey stole my iPhone"
let dictionary = ["monkey": "🐒", "iPhone":"📱"]
var newestString = sillyMonkeyString
for (string, emoji) in dictionary {
  newestString = newestString.replacingOccurrences(of: string, with: emoji)
}
print(newestString)

print("\nExercise 8 ------------------------------\n");
let numOfPennies = 567
print("$\(Double(numOfPennies) / 100)")

print("\nExercise 9 ------------------------------\n");
let array = ["A", "13", "B", "5", "87", "t", "41"] // TODO: Choose constant or variable
var sum = 0 // TODO: Choose constant or variable
for string in array {
  if Int(string) != nil {
    let intToAdd = Int(string)! // TODO: Choose constant or variable
    sum += intToAdd
  }
}
print(sum)

print("\nExercise 10a ------------------------------\n");
let startTime: Int
var currentTime: Int
let maximumTimeAllowed: Int
var timeRemaining: Int

print("\nExercise 10b ------------------------------\n");
let creditLimit: Int
var balance: Int

print("\nExercise 11 ------------------------------\n");
let stringToReverse = "Mutable or Immutable? That is the question." //TODO:Choose let or var
var reversedString = "" //TODO:Choose let or var
for character in stringToReverse.characters {
  reversedString = "\(character)" + reversedString
}
print(reversedString, terminator: "")
