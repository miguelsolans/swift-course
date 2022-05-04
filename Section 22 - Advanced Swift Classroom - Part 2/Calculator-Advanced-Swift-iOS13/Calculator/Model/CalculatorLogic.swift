//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Miguel Solans on 04/05/2022.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (calcMethod: String, number: Double)?;
    
    mutating func setNumber(_ number: Double) {
        self.number = number;
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            
            switch symbol {
                case "+/-": return n * -1;
                case "AC": return 0;
                case "%": return n / 100;
                case "=": return self.performTwoCalculation(numberB: n);
                default: self.intermediateCalculation = (calcMethod: symbol, number: n)
            }
            
            return n;
        }
        
        
        return nil;
    }
    
    func performTwoCalculation(numberB: Double) -> Double? {
        
        if let numberA = self.intermediateCalculation?.number,
            let operation = self.intermediateCalculation?.calcMethod {
            
            switch operation {
                case "+": return numberA + numberB
                case "×": return numberA * numberB
                case "-": return numberA - numberB
                case "÷": return numberA / numberB
                default: fatalError("Operation passed in does not match any of the cases")
            }
        }
        
        return nil;
    }
}
