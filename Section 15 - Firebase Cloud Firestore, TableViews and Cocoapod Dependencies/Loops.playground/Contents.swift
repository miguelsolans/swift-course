import Foundation

func printSplitter(title: String) -> Void {
    print("-------------------------------------------------------")
    print(title)
}



let names = ["Anna", "Alex", "Brian", "Jack"]

for name in names {
    print("Hello, \(name)!")
}


printSplitter(title: "Interate through the interval of 1 to 5, inclusive");
for number in 1...5 {
    print("Hello, \(number)")
}



let fruits: Set = ["Apple", "Pear", "Orange"];
let contacts = ["Adam": 123456789, "James": 13456789, "Amy": 123456789];
let word = "supercalifragilisticexpialidocious"
let halfOpenRange = 1..<5
let closedRange = 1...5;


printSplitter(title: "Set Iteration")
/*
 * Because it is a set, it will print out the most efficient way
 * so it will not care about original order
 */
for fruit in fruits {
    print("Fruit: \(fruit)");
}


printSplitter(title: "Dictionary")

for person in contacts {
    print(person.key)
}


printSplitter(title: "Words")
for letter in word {
    print(letter)
}


printSplitter(title: "Half Open Range")
for number in halfOpenRange {
    print(number)
}

printSplitter(title: "Closed Range")
for _ in closedRange {
    print("Loop is running")
}



printSplitter(title: "While Loops")

var currentTime = Date().timeIntervalSince1970
let oneSecondFromNow = currentTime + 1;

while currentTime < oneSecondFromNow {
    currentTime = Date().timeIntervalSince1970
    print("Waiting...");
}


