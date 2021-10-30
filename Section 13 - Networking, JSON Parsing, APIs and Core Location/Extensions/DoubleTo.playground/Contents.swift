import UIKit




// Rounds to a whole number
// myDouble.round()

// Let's use extension to take advantage of round and adapt to our problem


extension Double {
    func round(to places: Int) -> Double {
        let precisionNumber = pow(10, Double(places))
        
        var n = self;
        
        n = n * precisionNumber;
        n.round()
        n = n / precisionNumber
        
        return n;
        
    }
}

var myDouble = 3.14159

myDouble = myDouble * 1000;
myDouble.round()
myDouble = myDouble / 1000;

myDouble.round(to: 5);
