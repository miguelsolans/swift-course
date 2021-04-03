//
//  main.swift
//  ClassesDemo
//
//  Created by Miguel Solans on 02/04/2021.
//

// Initialise the Class
let skeleton = Enemy(health: 100, attackStrength: 100);
// Reference Skeleton on referenceSkeleton, because Enemy is a class. If we changed it to struct, then we would be copying values and creating a new variable
let referenceSkeleton = skeleton

skeleton.takeDamage(amount: 10);

// Will print `Skeleton 2: 90`
print("Skeleton 2: \(referenceSkeleton.health)");


let dragon = Dragon(health: 10, attackStrength: 150)
// Dragon has inherited from Enemy
dragon.wingSpan = 5;
dragon.attackStrength = 150;


dragon.talk(speech: "My teeth are swords!");

dragon.attack();


dragon.move();



// Structures
// Immutable;
// Passed by Value


// Classes
// Passed by Reference
// Features inheritance
