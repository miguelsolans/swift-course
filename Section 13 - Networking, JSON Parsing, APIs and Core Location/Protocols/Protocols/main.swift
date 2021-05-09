//
//  main.swift
//  Protocols
//
//  Created by Miguel Solans on 09/05/2021.
//

protocol CanFly {
    func fly()
}

class Bird {
    var isFemale = true;
    
    func layEgg() {
        if(isFemale) {
            print("The bird makes a new bird in a shell");
        }
    }
}


class Eagle: Bird, CanFly {
    func fly() {
        print("The eagle flaps its wings and lifts off into the sky");
    }
    func soar() {
        print("The eagle glides in the air using air currents");
    }
}

class Penguin: Bird {
    func swim() {
        print("The penguin paddles through the water");
    }
}

struct FlyingMuseum {
    func flyingDemo(flyingObject: CanFly) {
        flyingObject.fly()
    }
}

struct Airplane: CanFly {
    
    func fly() {
        print("The airplane uses its engine to lift off into the air");
    }
}

let oneEagle = Eagle()
//oneEagle.fly()
//oneEagle.layEgg()
//oneEagle.soar()

let onePenguin = Penguin()
//onePenguin.layEgg()
//onePenguin.swim()

let onePlane = Airplane()
let oneMuseum = FlyingMuseum()
oneMuseum.flyingDemo(flyingObject: onePlane)


// Advance Life Support Example
protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergyCalHandler {
    var delegate: AdvancedLifeSupport?;
    
    func assessSituation() {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency() {
        // Whoever is on hold, please perform CPR
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    
    init(handler: EmergyCalHandler) {
        handler.delegate = self;
    }
    
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second.");
    }
}


class Doctor: AdvancedLifeSupport {
    init(handler: EmergyCalHandler) {
        handler.delegate = self;
    }
    func performCPR() {
        print("The doctor does chest compressions, 30 per second");
    }
    func useStethescope() {
        print("Listening for heart sounds");
    }
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR();
        print("Sings staying alive by the BeeGees");
    }
    
    func useElectricDrill(){
        print("Whirr...");
    }
}

let emilio = EmergyCalHandler();
let pete = Paramedic(handler: emilio);
let angela = Surgeon(handler: emilio);

angela.performCPR()
angela.useElectricDrill()
angela.useStethescope()
