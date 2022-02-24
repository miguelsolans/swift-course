//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Miguel Solans on 23/02/2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        self.messageBubble.layer.cornerRadius = self.messageBubble.frame.height / 5
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
    }
}
