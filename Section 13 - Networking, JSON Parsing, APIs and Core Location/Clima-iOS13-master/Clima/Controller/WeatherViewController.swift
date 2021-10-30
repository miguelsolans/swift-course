//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation;

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager();
    var locationManager = CLLocationManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.weatherManager.delegate = self;
        self.searchTextField.delegate = self;
        
        locationManager.delegate = self;
        locationManager.requestWhenInUseAuthorization();
        locationManager.requestLocation();
        
    }
    
}

// Lets organize our ViewController by using extensions and sections

// MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
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
        if let city = self.searchTextField.text {
            self.weatherManager.fetchWeatherBy(city: city);
            self.cityLabel.text = city;
        }
        
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

// MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel) {
        // Because we are running on a completion / background, we must use DispatchQueue
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString;
            self.cityLabel.text = weather.cityName;
            self.conditionImageView.image = UIImage(systemName: weather.conditionName);
        }
    }
    
    func didFailWithError(error: Error) {
        print("Error!");
    }
}

// MARK: - CLLocationManagerDelegate
extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let lat = location.coordinate.latitude;
            let long = location.coordinate.longitude;
            
            print("Latitude: \(lat)\nLongitude: \(long)")
            
            self.weatherManager.fetchWeatherBy(lat: String(lat), long: String(long))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Got an error")
    }
}
