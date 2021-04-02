//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.storyLabel.text = self.storyBrain.getCurrentStory().title;
        self.choice1Button.setTitle(self.storyBrain.getCurrentStory().choice1, for: .normal);
        self.choice2Button.setTitle(self.storyBrain.getCurrentStory().choice2, for: .normal);
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!;
        
        print("Choice: \(userAnswer)");
        
        storyBrain.checkAnswer(userAnswer);
        
        self.updateUI();
    }
    
    func updateUI() {
        
        self.storyLabel.text = self.storyBrain.getCurrentStory().title;
        self.choice1Button.setTitle(self.storyBrain.getCurrentStory().choice1, for: .normal);
        self.choice2Button.setTitle(self.storyBrain.getCurrentStory().choice2, for: .normal);
        
    }
    
}

