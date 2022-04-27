import Foundation

// Create properties whose values can be canculated on the go by the code we write
// e.g. calculate an area based on the change of Height and Width


/*!
 * Getters and Setters
 */

let pizzaInInches: Int = 16;
var numberOfPeople: Int = 12
let slicesPerPerson: Int = 4;


// To use Computed Properties, it must be a var. Otherwise, a constant can't change.
var numberOfSlices: Int {
    // get block is optional. But using it is more specific.
    get {
        return pizzaInInches - 4
    }
    // Set Block is executed whenever this property is assigned a new value
    set {
        print("numberOfSlices now has a new value which is \(newValue)")
    }
};


// If we try to assign a value to a var that only has a get block, it will throw an error
numberOfSlices = 12


var numberOfPizza: Int {
    get {
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        
        return numberOfPeople / numberOfPeopleFedPerPizza;
    }
    set {
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicesPerPerson;
    }
}


print("Number of Pizzas: \(numberOfPizza)")

numberOfPizza = 6;

print("Number of People We can Feed: \(numberOfPeople)")
