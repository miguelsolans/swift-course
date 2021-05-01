//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Miguel Solans on 01/05/2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation
import UIKit


struct CalculatorBrain {
    
    var bmi: BMI?;
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height);
        
        if(bmiValue < 18.5) {
            print("Underweight.");
            
            self.bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1));
        } else if(bmiValue < 24.9) {
            print("Normal.");
            
            self.bmi = BMI(value: bmiValue, advice: "Fir as a fiddle!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1));
        } else {
            print("Overweight.");
            
            self.bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1));
        }
        
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", self.bmi?.value ?? 0.0);
    }
    
    func getAdvice() -> String {
        return self.bmi?.advice ?? "You haven't input Height and Weight!";
    }
    
    func getColor() -> UIColor {
        return self.bmi?.color ?? #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
    }
}
