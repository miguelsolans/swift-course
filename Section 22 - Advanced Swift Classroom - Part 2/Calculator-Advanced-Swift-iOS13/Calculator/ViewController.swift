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
    
    // fileprivate: only accessible within the file it has been created
    // internal: acessible anywhere within the current app module. This is what a var is set by default
    // public: access is granted to other modules, for example a Pod can be accessible by other project groups
    // open: allows classes and functions to be sub-classed and overriden
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        isFinishedTypingNumber = true;
        
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            print("Button Pressed: \(numValue)");
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue;
                
                isFinishedTypingNumber = false;
            } else {
                displayLabel.text?.append(numValue)
            }
            
        }
    }

}

