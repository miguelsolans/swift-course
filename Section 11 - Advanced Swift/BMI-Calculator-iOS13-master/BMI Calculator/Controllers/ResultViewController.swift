//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Miguel Solans on 03/04/2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultBackground: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupInterface();
    }
    
    func setupInterface() {
        self.resultLabel.text = bmiValue;
        self.resultBackground.backgroundColor = color;
        self.adviceLabel.text = self.advice;
        
    }
    @IBAction func recalculateButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil);
    }
}
