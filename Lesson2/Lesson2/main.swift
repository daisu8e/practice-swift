import Foundation

print("\nExercise 1a ------------------------------\n");
var moviesDict:Dictionary = ["Star Wars": "George Lucas", "Point Break": "Kathryn Bigelow"]
var movie = "Point Break"
if let director = moviesDict[movie] {
  print(director)
} else {
  print("nil")
}

print("\nExercise 1b ------------------------------\n");
moviesDict["aaa"] = nil
movie = "aaa"
if let director = moviesDict[movie] {
  print(director)
} else {
  print("nil")
}

print("\nExercise 2 ------------------------------\n");
////: ### Exercise 2
////: The LoginViewController class below needs a UITextField to hold a user's name. Declare a variable for this text field as a property of the class LoginViewController. Keep in mind that the textfield property will not be initialized until after the view controller is constructed.
//class LoginViewController: UIViewController {
//}

print("\nExercise 3a ------------------------------\n");
var numericalString = "3"
var number = Int(numericalString)
if let n = number {
  print("\(n) is the magic number.")
} else {
  print("nil")
}

print("\nExercise 3b ------------------------------\n");
numericalString = "three"
number = Int(numericalString)
if let n = number {
  print("\(n) is the magic number.")
} else {
  print("nil")
}

print("\nExercise 4 ------------------------------\n");
////: ### Exercise 4
////: The class UIViewController has a property called tabBarController.  The tabBarController property is an optional of type UITabBarController?. The tabBarController itself holds a tabBar as a property. Complete the code below by filling in the appropriate use of optional chaining to access the tab bar property.
//var viewController = UIViewController()
////if let tabBar = //TODO: Optional chaining here {
////    print("Here's the tab bar.")
////} else {
////    print("No tab bar controller found.")
////}

print("\nExercise 5a ------------------------------\n");
var paintingDict:Dictionary = ["Guernica": "Picasso", "Mona Lisa": "da Vinci", "No. 5": "Pollock"]
var painting = "Mona Lisa"
if let artist = paintingDict[painting] {
  print(artist)
} else {
  print("nill")
}

print("\nExercise 5b ------------------------------\n");
paintingDict["aaa"] = nil
painting = "aaa"
if let artist = paintingDict[painting] {
  print(artist)
} else {
  print("nill")
}

print("\nExercise 6 ------------------------------\n");
////: ### Exercise 6
////: Set the width of the cancel button below.  Notice that the cancelButton variable is declared as an implicitly unwrapped optional.
//var anotherViewController = UIViewController()
//var cancelButton: UIBarButtonItem!
//cancelButton = UIBarButtonItem()
//// TODO: Set the width of the cancel button.

print("\nExercise 7 ------------------------------\n");
////: ### Exercise 7
////: The class UIViewController has a property called parent.  The parent property is an optional of type UIViewController?. We can't always be sure that a given view controller has a parent view controller.  Safely unwrap the parent property below using if let.
//var childViewController = UIViewController()
//// TODO: Safely unwrap childViewController.parent

