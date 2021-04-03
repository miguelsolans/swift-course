//
//  Enemy.swift
//  ClassesDemo
//
//  Created by Miguel Solans on 02/04/2021.
//

// Structs are immutable, hence the need the mutating before function declarations

class Enemy {
     // Attributes or Properties
    var health: Int;
    var attackStrength: Int;
    
    // Classes needs their own initialisers
    init(health: Int, attackStrength: Int) {
        self.health = health;
        self.attackStrength = attackStrength;
    }
    
    func takeDamage(amount: Int) {
        self.health = self.health - amount;
    }
    
    // Describe behaviors
    func move() {
        print("Walking...");
    }
    func attack() {
        print("Attacking with \(attackStrength) damage.");
    }
}
