//
//  WeatherData.swift
//  Clima
//
//  Created by Miguel Solans on 04/07/2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

// Decodable Protocol: a type that can decode itself from an external representation, like JSON
struct WeatherData: Decodable {
    let name : String;
    let main: Main;
    let weather: [Weather]
}

struct Main: Decodable {
    let temp : Double;
}

struct Weather: Decodable {
    let id: Int;
    let main: String;
    let description: String;
    let icon: String;
}
