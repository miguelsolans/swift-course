//
//  QuizBrainModel.swift
//  Quizzler-iOS13
//
//  Created by Miguel Solans on 12/03/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    var currentQuestion : Int = 0;
    var score : Int = 0;
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], c: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], c: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], c: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], c: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], c: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], c: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], c: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], c: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], c: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], c: "Australia")
    ];
    
    
    // Methods with an external param name
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        let result = userAnswer == self.quiz[currentQuestion].correctAnswer;
        
        if(result) {
            self.score += 1;
        }
        
        return result;
    }
    
    func getQuestionText() -> String {
        return self.quiz[currentQuestion].text;
    }
    
    func getCurrentProgress() -> Float {
        
        return Float(self.currentQuestion + 1) / Float(self.quiz.count);
    }
    
    func getScore() -> Int {
        return self.score;
    }
    
    func getAnswerA(i : Int) -> String {
        return self.quiz[currentQuestion].answer[i];
    }
    
    // Because structs are blueprints to future objects, we need to use mutating keyword for changing actual values within the struct
    mutating func nextQuestion() {
        self.currentQuestion += 1;
        
        if self.currentQuestion >= self.quiz.count {
            self.currentQuestion = 0;
            self.score = 0;
        }
    }
    
}
