//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var calculatorBrain = CalculatorBrain();
    
    var result = "0.0";
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value);
        
        print("Height: \(height)");
        
        self.heightLabel.text = "\(height)m";
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value);
        
        print("Width: \(weight)");
        
        self.weightLabel.text = "\(weight)Kg";
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        self.calculatorBrain.calculateBMI(height:self.heightSlider.value , weight: self.weightSlider.value);
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult") {
            let destinationVC = segue.destination as! ResultViewController;
            // destinationVC.result = self.result;
            destinationVC.bmiValue = self.calculatorBrain.getBMIValue();
            destinationVC.advice = self.calculatorBrain.getAdvice();
            destinationVC.color = self.calculatorBrain.getColor();
        }
    }
}

