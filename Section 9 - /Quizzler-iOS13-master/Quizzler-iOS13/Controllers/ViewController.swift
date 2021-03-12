//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var answerAButton: UIButton!
    @IBOutlet weak var answerBButton: UIButton!
    @IBOutlet weak var answerCButton: UIButton!
    
    var quizBrain = QuizBrain();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.updateUI();
        self.updateAnswers();
        
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        
        let result: Bool = self.quizBrain.checkAnswer(sender.currentTitle!);
        
        
        sender.backgroundColor = result ? UIColor.green : UIColor.red;
        
        self.quizBrain.nextQuestion();
        
        self.updateUI()
    }
    
    func updateAnswers() {
        self.answerAButton.setTitle(self.quizBrain.getAnswerA(i: 0), for: .normal);
        self.answerBButton.setTitle(self.quizBrain.getAnswerA(i: 1), for: .normal);
        self.answerCButton.setTitle(self.quizBrain.getAnswerA(i: 2), for: .normal);
    }
    
    
    func updateUI() {
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (_) in
            
            self.questionLabel.text = self.quizBrain.getQuestionText()
            self.updateAnswers();
            
            self.answerAButton.backgroundColor = UIColor.clear;
            self.answerBButton.backgroundColor = UIColor.clear;
            self.answerCButton.backgroundColor = UIColor.clear;
            
            self.progressView.progress = self.quizBrain.getCurrentProgress();
            
            self.scoreLabel.text = "Score \(self.quizBrain.getScore())"
        
        }
        
    }
    
}

