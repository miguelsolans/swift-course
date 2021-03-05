//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // iOS uses camelCase text
    // IBOutlet - Interface Builder Outlet allows us to reference specific User Interface elements
    @IBOutlet weak var leftDiceImageView: UIImageView!
    @IBOutlet weak var rightDiceImageView: UIImageView!
    
    // We use let instead of var because the array elements never change
    let diceFaces = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")];
    
    // Condition: the view loads up. When the app shows up on the phone
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Change to a diceSix, we can do it with dot notation: Who.What = Value
        // self.leftDiceImageView.image = #imageLiteral(resourceName: "DiceSix")
        // self.leftDiceImageView.image = #imageLiteral(resourceName: "DiceTwo")

    }
    
    // When we want the code to change the user interface we use IBOutlet
    // When we want the user interface to perform certain actions we use IBAction
    
    // Allows user interaction (actions) on a view
    // Event: touch up inside means the user has touched within the boundary of the elements
    @IBAction func rollTheDiceTapped(_ sender: Any) {
        print("Roll the Dice got tapped.");
        
        // Int.random(in: lower ... upper), where upper bound is included
        // Int.random(in: lower ..< upper, where upper bound is not included
        leftDiceImageView.image = diceFaces[Int.random(in: 0...5)];
        rightDiceImageView.image = diceFaces[Int.random(in: 0...5)];

    
        
    }
    
}

