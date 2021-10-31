//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var coinManager = CoinManager();

    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.currencyPicker.delegate = self;
        self.currencyPicker.dataSource = self;
        self.coinManager.delegate = self;
    }


}

extension ViewController : CoinManagerDelegate {
    func didFailWithError() {
        print("Failed with Error")
        
        DispatchQueue.main.async {
            let alertMessage = UIAlertController(title: "Oops!", message: "An error ocurred while fetching rates", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
            
            self.present(alertMessage, animated: true, completion: nil);
        }
        
    }
    
    func didUpdateCoin(output: RateOutput) {
        print("Success!");
        
        DispatchQueue.main.async {
            self.bitcoinLabel.text = String(format: "%.2f", output.rate)
        }
    }
}


extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count;
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[ row ];
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.coinManager.fetchCoinsWith(coinName: self.coinManager.currencyArray[ row ]);
    }
}
