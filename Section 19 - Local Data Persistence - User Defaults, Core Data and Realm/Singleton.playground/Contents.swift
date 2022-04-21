import UIKit

// There's only one copy of it that can be shared across classes

class Car {
    var colour = "Red";
}


let myCar = Car();
myCar.colour = "Blue";


let yourCar = Car();
// It will display Red since it's a new Car
print(yourCar.colour);



class CarSingleton {
    var colour = "Red";
    
    static let singletonCar = Car();
}


let myNewCar = CarSingleton.singletonCar
myCar.colour = "Blue";

let yourNewCar = CarSingleton.singletonCar;
print("Your New Car: \(yourNewCar.colour)");



class A {
    init() {
        CarSingleton.singletonCar.colour = "Brown"
    }
}

class B {
    init() {
        print(CarSingleton.singletonCar.colour)
    }
}

// Will change colour property on singleton to Brown
let a = A();
// Will display Brown given the change on singleton level previously
let b = B();
