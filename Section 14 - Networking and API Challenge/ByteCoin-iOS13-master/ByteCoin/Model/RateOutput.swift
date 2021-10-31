//
//  RateOutput.swift
//  ByteCoin
//
//  Created by Miguel Solans on 30/10/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct RateOutput: Decodable{
    
    let time: String
    let assetBase: String
    let assetQuote: String
    let rate: Double
    
    private enum CodingKeys: String, CodingKey {
        case time = "time"
        case assetBase = "asset_id_base"
        case assetQuote = "asset_id_quote"
        case rate = "rate"
    }
}
