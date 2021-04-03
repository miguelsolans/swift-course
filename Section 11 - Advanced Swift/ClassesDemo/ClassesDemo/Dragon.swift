//
//  Dragon.swift
//  ClassesDemo
//
//  Created by Miguel Solans on 02/04/2021.
//


// Classes have the ability to inherit from a superclass

class Dragon: Enemy {
    var wingSpan = 2;
    
    func talk (speech: String) {
        print("Says: \(speech)");
    }
    
    // Override behavior
    override func move() {
        print("Flying...")
    }
    
    override func attack() {
        // Refers to enemy superclass
        // Executes behavior defined by superclass and executes something else defined here
        super.attack();
        print("Spit fire with \(self.attackStrength)");
    }
}
