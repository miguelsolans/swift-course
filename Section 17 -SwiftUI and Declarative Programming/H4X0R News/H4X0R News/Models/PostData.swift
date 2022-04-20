//
//  PostData.swift
//  H4X0R News
//
//  Created by Miguel Solans on 25/03/2022.
//

import Foundation


struct Results: Decodable {
    
    let hits: [Post]
    
}

// Identifiable allow our list to recognize the order of our posts by id
struct Post: Decodable, Identifiable {
    // Computed Property
    var id: String {
        return objectID
    }
    
    let objectID: String 
    let points: Int
    let title: String
    let url: String?
    
    
}
