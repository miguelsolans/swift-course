//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Miguel Solans on 01/05/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController : UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var chooseSplitLabel: UILabel!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var splitBy = 2;
    var totalBill = 0.0;
    var finalResult = "0.0"
    var tip = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        self.resetToDefault();
        sender.isSelected = true;
        self.getSelectedTip();
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        self.chooseSplitLabel.text = String(format: "%.0f", sender.value);
        splitBy = Int(sender.value);
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!;
        
        if bill != "" {
            self.totalBill = Double(bill)!;
            
            let result = self.totalBill * ( 1 + self.tip ) / Double(self.splitBy);
            self.finalResult = String(format: "%.2f", result);
            print(finalResult)
            
        }
    
        self.performSegue(withIdentifier: "goToResult", sender: self);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult") {
            let destinationVC = segue.destination as! ResultViewController;
            
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = splitBy
        }
    }
    func getSelectedTip() {
        
        if(self.zeroPctButton.isSelected) {
            self.tip = 0.0
        } else if(self.tenPctButton.isSelected) {
            self.tip = 0.1
        } else {
            self.tip = 0.2
        }
        
    }
    
    func resetToDefault() {
        self.zeroPctButton.isSelected = false;
        self.tenPctButton.isSelected = false;
        self.twentyPctButton.isSelected = false;
    }
}
