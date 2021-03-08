//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720];
    
    var player : AVAudioPlayer!
    var timer = Timer()
    
    var secondsRemaining = 60;
    var totalTime = 0;
    var secondsPassed = 0;
    
    @IBOutlet weak var resetButton: UIButton!
    override func viewDidLoad() {
        self.resetButton.isHidden = true;
    }
    @IBAction func hardnessTapped(_ sender: UIButton) {
        
        // We need to invalidate previous timer if we pressed the butto again
        timer.invalidate()
        // Hardness is an optional string. or nil...
        var hardness : String!
            
        hardness = sender.currentTitle;
        
        totalTime = eggTimes[hardness]!;
        // Timer updates every second
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        
        resetAll();
        self.resetButton.isHidden = true;
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1;
            let progress = Float(secondsPassed) / Float(totalTime);
            
            print("\(secondsPassed) / \(totalTime) = \(progress)");
            
            self.progressView.progress = progress;
        } else {
            self.progressView.progress = 1.0;
            timer.invalidate();
            
            self.titleLabel.text = "Done!";
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3");
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
            self.resetButton.isHidden = false;
        }
    }
    
    func resetAll() {
        if self.player.isPlaying {
            self.player.pause();
        }
        self.player.stop()
        self.progressView.progress = 0;
        timer.invalidate()
        self.titleLabel.text = "How do you like your eggs?"
    }
}
