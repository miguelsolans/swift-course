//
//  Item.swift
//  Todoey
//
//  Created by Miguel Solans on 21/04/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

// Item is capable to be codable to JSON, PLIST and so on
class Item : Codable {
    var title: String = "";
    var done: Bool = false;
}
