import Foundation

print("\nExercise 1 ------------------------------\n");
var movieTitleArray = ["Point Break", "The Dark Knight", "Star Wars", "When Harry Met Sally"]
for title in movieTitleArray {
  print("\(title) with Puppets!")
}

print("\nExercise 2 ------------------------------\n");
var oldMountainViewRent:[Double] = [2150, 1775, 2221, 1261, 1325, 2110, 1870]
var newMountainViewRent:[Double] = []
for rent in oldMountainViewRent {
  newMountainViewRent.append(rent + rent * 0.2)
}
print(newMountainViewRent)

print("\nExercise 3 ------------------------------\n");
var polarizingFoods = ["Anchovies":true, "Coconut":true, "Cilantro":true, "Liver": false]
for (name, taste) in polarizingFoods {
  print("\(name), \(taste ? "yum" : "yuck")!")
}

print("\nExercise 4 ------------------------------\n");
var rapperPhoneNumbers = ["Azealia Banks":"(212)548-8777", "Boots Riley":"(415)755-9887", "MC Hammer":"(415)533-9899", "Missy Elliot":"(757)488-5552", "Shock G":"(415)499-7676", "Sir Mix-a-lot":"(206)123-4567", "Snoop Dogg":"(213)760-6664"]
for (name, phone) in rapperPhoneNumbers {
  rapperPhoneNumbers[name] = phone.replacingOccurrences(of: "(415)", with: "(510)")
}
print(rapperPhoneNumbers)


print("\nExercise 5 ------------------------------\n");
enum Sport {
  case baseball, basketball, football, hockey, soccer
}
var sport = Sport.basketball
switch sport {
case .baseball: print("Go A's!")
case .basketball: print("Go Warriors!")
case .football: print( "Go Raiders!")
case .hockey: print("Go Sharks!")
case .soccer: print("Go Earthquakes!")
}

print("\nExercise 6 ------------------------------\n");
enum roshamboMove {
  case rock, paper, scissors
}
var myMove = roshamboMove.scissors
var yourMove = roshamboMove.scissors
var resultsMessage = ""
switch true {
case myMove == .rock && yourMove == .paper || myMove == .paper && yourMove == .rock: resultsMessage = "Paper covers Rock."
case myMove == yourMove: resultsMessage = "It's a tie!"
case myMove == .rock && yourMove == .scissors || myMove == .scissors && yourMove == .rock: resultsMessage = "Rock crushes Scissors. "
case myMove == .paper && yourMove == .scissors || myMove == .scissors && yourMove == .paper: resultsMessage = "Scissors cut Paper."
default: break
}
print(resultsMessage)

print("\nExercise 7 ------------------------------\n");
var score = 89
var letterGrade = ""
switch score {
case 90...100: letterGrade = "A"
case 80...89: letterGrade = "B"
case 70...79: letterGrade = "C"
case 60...69: letterGrade = "D"
default: letterGrade = "Incomplete"
}
print(letterGrade)

print("\nExercise 8 ------------------------------\n");
var word = "cxn"
var firstLetter = word[word.startIndex]
var newWord = ""
var vowels: [Character] = ["a", "e", "i", "o", "u"]
switch true {
case word.contains("a"): fallthrough
case word.contains("e"): fallthrough
case word.contains("i"): fallthrough
case word.contains("o"): fallthrough
case word.contains("u"): fallthrough
  newWord = word + "yay"
default:
  word.remove(at: word.startIndex)
  newWord = "\(word)\(firstLetter)ay"
}
print(newWord)
