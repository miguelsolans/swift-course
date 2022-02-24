//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Miguel Solans on 23/02/2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation

// We use this file to reduce repeating strings


struct K {
    static let appName = "⚡️FlashChat"
    static let cellIdentifier = "MessageCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
