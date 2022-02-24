//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var messages: [MessageModel] = [
        MessageModel(sender: "1@2.com", body: "Hey!"),
        MessageModel(sender: "1@2.com", body: "Hello!"),
        MessageModel(sender: "1@2.com", body: "What's up?")
    ]
    
    @IBOutlet weak var logoutButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.logoutButton.title = "Logout"
        
        
        self.navigationItem.hidesBackButton = true;
        self.title = K.appName
        
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        
        self.tableView.register(UINib(nibName: K.cellNibName, bundle:nil), forCellReuseIdentifier: K.cellIdentifier)
        
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        let firebaseAuth = Auth.auth();
        
        do {
            try firebaseAuth.signOut()
            
            self.navigationController?.popViewController(animated: true)
        } catch let signError as NSError {
            print("Error signing out: \(signError.localizedDescription)")
        }
    }
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        
        let message = self.messages[ indexPath.row ]
        
        cell.messageLabel.text = message.body
        
        return cell;
        
    }
    
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
        
        
    }
}
