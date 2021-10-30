//
//  WeatherManager.swift
//  Clima
//
//  Created by Miguel Solans on 04/06/2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//  Notes: Step to go through
//      (1)     Create URL Object
//      (2)     Create URLSession: will be doing our networking
//      (3)     Give URLSession a task: like a GET resource
//      (4)     Start the task (request!)

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
    func didFailWithError(error: Error);
}

struct WeatherManager {
    let urlStringByCity = "https://api.openweathermap.org/data/2.5/weather?q=%@&appid=%@&units=metric";
    let urlStringByCoordinates = "https://api.openweathermap.org/data/2.5/weather?appid=%@&units=metric&lat=%@&lon=%@"
    var delegate : WeatherManagerDelegate?;
    func fetchWeatherBy(city: String) {
        
        let urlString = String(format: urlStringByCity, city, self.getApiKey());
        
        performRequest(with: urlString);
        
    }
    
    func fetchWeatherBy(lat: String, long: String) {
        let urlString = String(format: urlStringByCoordinates, self.getApiKey(), lat, long);
        
        performRequest(with: urlString);
    }
    
    func getApiKey() -> String {
        return String(ProcessInfo.processInfo.environment["api_key"] ?? "none");
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default);
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!);
                    
                    self.delegate?.didFailWithError(error: error!);
                    return;
                }
                
                if let safeData = data {
                    if let safeWeather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(weather: safeWeather);
                        
                    } else {
                        print("Parser threw an error");
                    }
                }
            }
            
            task.resume();
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder();
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData);
            let id = decodedData.weather[0].id;
            let temperature = decodedData.main.temp;
            let name = decodedData.name;
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temperature);
            
            return weather;
        } catch {
            print("Oops!\n\(error)");
            return nil;
        }
    }
    
    
}
