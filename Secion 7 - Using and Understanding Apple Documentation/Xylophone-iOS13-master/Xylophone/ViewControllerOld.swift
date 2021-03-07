//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
// Work with audiovisual assets, control cameras, process audio and config. system audio interactions
import AVFoundation

class ViewController: UIViewController {
    // Playback and recording of a single track
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playSound(note: String) {
        // Bundle: a representation of the coded and resources stored on disk
        // The main bundle will locate sound resource
        guard let url = Bundle.main.url(forResource: note, withExtension: "wav") else {return}
        
        do {
            // AVAudioSession
            // setCategory: sets the current audio session category. How the app intends to use the audio (playback -> can be used with the sound turned of)
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default);
            try AVAudioSession.sharedInstance().setActive(true);
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue);
            
            guard let player = player else { return }
            
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }


    @IBAction func keyTapped(_ sender: UIButton) {
        print("I got pressed");
        self.playSound(note: "C");
    }
    
}

