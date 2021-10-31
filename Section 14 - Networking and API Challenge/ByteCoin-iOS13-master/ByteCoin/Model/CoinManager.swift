//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didFailWithError()
    func didUpdateCoin(output: RateOutput)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/%@/USD"
    let apiKey = "YOUR_API_KEY_HERE"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var delegate: CoinManagerDelegate?
    
    func fetchCoinsWith(coinName: String) {
        let urlString = String(format: self.baseURL, coinName);
        
        self.performRequest(with: urlString);
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            
            var request = URLRequest(url: url);
            request.httpMethod = "GET"
            request.setValue(self.getApiKey(), forHTTPHeaderField: "X-CoinAPI-Key")
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if(error != nil) {
                    self.delegate?.didFailWithError()
                    return;
                }
                if let safeData = data {
                    
                    if let safeCoin = self.parseData(coinData: safeData) {
                        self.delegate?.didUpdateCoin(output: safeCoin)
                    } else {
                        print("Parser threw an error");
                        self.delegate?.didFailWithError()
                    }
                }
            }
            
            task.resume();
            
        }
    }
    
    func getApiKey() -> String {
        return String(ProcessInfo.processInfo.environment[ "apiKey" ] ?? "none");
    }
    func parseData(coinData: Data) -> RateOutput? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(RateOutput.self, from: coinData);
            
            print(decodedData);
            
            return RateOutput(time: decodedData.time, assetBase: decodedData.assetBase, assetQuote: decodedData.assetQuote, rate: decodedData.rate)
        } catch {
            print("Oops!\n\(error)");
            return nil;
        }
    }
}
