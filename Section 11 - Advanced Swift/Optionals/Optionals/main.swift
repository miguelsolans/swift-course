//
//  main.swift
//  Optionals
//
//  Created by Miguel Solans on 01/05/2021.
//

var myOptional: String?

myOptional = "Miguel"
// myOptional = nil

// 1.  Force Unwrapping:
// if the myOptional = nil, our App will crash on long term because it unexpectedly found nil
// Not safe for work with large scale Apps
let forceUnwrapping: String = myOptional!

// 2.  Check for nil value

if myOptional != nil {
    let checkForNil: String = myOptional!
    let anotherCheckForNil: String = myOptional!
} else {
    print("Optional was found to be nil.")
}


// 3.  Optional Binding
// We write an if let to bind the optinal value if not nil

if let safeOptional = myOptional {
    let safeOptionalString: String = myOptional!
    print("Optional Binding: \(safeOptionalString)")
} else {
    print("Optional Binding was found to be nil.")
}


// 4.  Nil Coalescing Operator
// check if the optinal is nil we use a default value
let coalescingOperator: String = myOptional ?? "I am a default value"
print("Nil Coalescing Operator is: \(coalescingOperator)")


// Working with Structs

struct MyOptionalStruct {
    var property = 123
    
    func method() {
        print("I am the struct's method.")
    }
}
// We haven't hearby initialized it, yet. We have declared its type though!
let myOptionalStruct: MyOptionalStruct?

// Initializing...
myOptionalStruct = MyOptionalStruct()
myOptional = nil
// We can't do this, because the struct is an optional, unless we unwrap it, but forcing it can cause it to crash. To solve this, we use Optional Chaining
// print(myOptionalStruct!.property)

// 5.  Optional Chaining
// If optional is not nil, we continue with the following statement

// Because we once said it's nil, it will print nothing
print(myOptionalStruct?.method())
