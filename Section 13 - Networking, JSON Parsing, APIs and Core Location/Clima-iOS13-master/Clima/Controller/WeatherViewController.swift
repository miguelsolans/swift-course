//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.searchTextField.delegate = self;
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text!);
        
        searchTextField.endEditing(true);
        return true;
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        print(searchTextField.text!);
        
        searchTextField.endEditing(true);
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.searchTextField.text = "";
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if(textField.text != "") {
            return true;
        } else {
            textField.placeholder = "Type Something";
            return false;
        }
    }
}

