//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Miguel Solans on 03/04/2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var result: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.resultLabel.text = result;
    }
    
    @IBAction func recalculateButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil);
    }
}
