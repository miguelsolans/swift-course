//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    // private: is scoped limited
    private var isFinishedTypingNumber: Bool = true;
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double")
            }
            return number;
        } set {
            self.displayLabel.text = String(newValue);
        }
    }
    
    // fileprivate: only accessible within the file it has been created
    // internal: acessible anywhere within the current app module. This is what a var is set by default
    // public: access is granted to other modules, for example a Pod can be accessible by other project groups
    // open: allows classes and functions to be sub-classed and overriden
    private var calculator = CalculatorLogic();
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        self.isFinishedTypingNumber = true;
        
        self.calculator.setNumber(displayValue);
        
        if let calcMethod = sender.currentTitle {
            
            
            guard let result = self.calculator.calculate(symbol: calcMethod) else {
                fatalError("The result of calculation is nil");
            }
            
            self.displayValue = result;
        }
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            print("Button Pressed: \(numValue)");
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue;
                
                isFinishedTypingNumber = false;
            } else {
                
                if numValue == "." {
                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                        fatalError("NaN");
                    }
                    
                    let isInt = floor(currentDisplayValue) == currentDisplayValue;
                    
                    if(!isInt){
                        return;
                    }
                }
                
                displayLabel.text?.append(numValue)
            }
            
        }
    }

}

