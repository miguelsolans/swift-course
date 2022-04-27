import Foundation

/*!
 * Observed Properties
 */


// Observed Properties must be a var
var pizzaInInches: Int = 10 {
    willSet {
        // Accessing pizzaInInches will access old value
        print("willSet: \(newValue)")
    }
    didSet {
        // Accessing pizzaInInches will access the new value
        print("oldValue: \(oldValue)")
        
        if(pizzaInInches >= 18) {
            print("Invalid size specified, pizzaInInches set to 18");
            pizzaInInches = 18;
        }
    }
}


pizzaInInches = 8;

pizzaInInches = 10;


pizzaInInches = 33;

print(pizzaInInches) // will display 18, since we changed on didSet if block
