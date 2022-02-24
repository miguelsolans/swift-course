import Foundation

// as       - used to raise a object to its superclass type
// as?      - safer way of downcasting as! as it will skip it if does not contain the class type
// as!      - used when we want to convert one object with a specific data-type to a subclass that inherits from it. For example, a custom UITableViewCell.
// is       - allows us to have an object checked if he is a certain data type

// any      - allows any data type
class Animal {
    var name: String
    init(n: String) {
        name = n
    }
}

class Human: Animal {
    func code() {
        print("Typing away...")
    }
}

class Fish: Animal {
    func breatheUnderWater() {
        print("Breathing under water...")
    }
}

var miguel = Human(n: "Miguel Solans")
var jack = Human(n: "Jack")
var nemo = Fish(n: "Nemo")

let neighbours = [miguel, jack, nemo]


let neighbour1 = neighbours[ 0 ]

if neighbours[ 2 ] is Human {
    print("First Neighbour is a Human")
} else {
    print("Third Neighbour is not a Human")
}


func findNemo(from animals: [Animal]) {
    for animal in animals {
        if animal is Fish {
            print("Found \(animal.name)!")
            // animal.breatheUnderWater() // Because animal is Animal data type it does not have the breatheUnderWater()
            
            // hence we cast it to the sub-class Fish
            let fish = animal as! Fish
            fish.breatheUnderWater()
            
        }
    }
}

findNemo(from: neighbours)

// Compiler does not throw an error
// An error is thrown at runtime: "Could not cast value of ZZZ to YYY"
// let fish = neighbours[ 1 ] as! Fish

// If we are not sure what subclass, we use optional. For this example, breathUnderWater() will be skipped
if let fish = neighbours[ 1 ] as? Fish {
    fish.breatheUnderWater()
}


