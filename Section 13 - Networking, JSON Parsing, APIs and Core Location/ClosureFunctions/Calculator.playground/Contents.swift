import UIKit

func calculator (n1: Int, n2: Int) -> Int {
    return n1 + n2;
}


calculator(n1: 2, n2: 5);



// If we want our calculator to multiply, we would have to change its internal behavior.
// To overcome this, we could pass on a function


func add (n1: Int, n2: Int) -> Int {
    return n1 + n2;
}

func multiply (n1: Int, n2: Int) -> Int {
    return n1 * n2;
}

/**
 * We pass function operation, add or multiply
 */
func calculatorByFunction (n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2);
}


calculatorByFunction(n1: 2, n2: 3, operation: add)


calculatorByFunction(n1: 1, n2: 2, operation: multiply)

/*
 * Closures are anonymous functions, or function without a name
 * The data type is inferred by the compiler
 */
calculatorByFunction(n1: 2, n2: 3, operation: { (no1: Int, no2: Int) in
    no1 * no2;
});


/*
 * Real Life Example
 * We want to add one to each element in the array. Instead of using a for loop, we can use a function called map
 * Map allows us to transfor every single element in a collection
 */

let array = [6, 2, 3, 9, 4, 1];

// Define a rule to transform array
func addOne(n1: Int) -> Int {
    return n1 + 1;
}

array.map(addOne(n1:))

// Or we can use closures
print(array.map({$0 + 1}));

// Let's suppose we are working with strings
let newArray = array.map({"\($0)"})
print(newArray)
