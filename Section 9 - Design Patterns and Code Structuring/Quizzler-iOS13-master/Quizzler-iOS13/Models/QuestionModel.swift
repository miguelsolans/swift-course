//
//  QuestionModel.swift
//  Quizzler-iOS13
//
//  Created by Miguel Solans on 09/03/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation


struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], c: String) {
        self.text = q;
        self.answer = a;
        self.correctAnswer = c;
    }
}
