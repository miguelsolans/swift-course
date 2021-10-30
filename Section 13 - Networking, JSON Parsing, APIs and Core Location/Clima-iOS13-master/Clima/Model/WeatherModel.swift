//
//  WeatherModel.swift
//  Clima
//
//  Created by Miguel Solans on 04/07/2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int;
    let cityName: String;
    let temperature: Double;
    
    // Computed Property
    var conditionName: String {
        return self.getConditionName();
    }
    
    var temperatureString: String {
        return String(format: "%.1f", self.temperature);
    }
    
    func getConditionName() -> String {
        switch self.conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
