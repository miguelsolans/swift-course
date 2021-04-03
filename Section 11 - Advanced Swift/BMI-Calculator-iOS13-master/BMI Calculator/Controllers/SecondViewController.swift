//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by Miguel Solans on 03/04/2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var result: String?;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        view.backgroundColor = .red;
        
        // Programmatically UI
        let label = UILabel();
        label.text = self.result;
        // Defines the UILabel location onscreen
        // Label will be shown on top left corner
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50);
        
        // Add the label to the screen
        view.addSubview(label);
        
    }
    
    
    
}
