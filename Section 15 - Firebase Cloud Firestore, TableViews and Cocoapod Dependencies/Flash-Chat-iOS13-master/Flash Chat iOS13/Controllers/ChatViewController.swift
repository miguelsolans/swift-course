//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore();
    
    var messages: [MessageModel] = [ ]
    
    @IBOutlet weak var logoutButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.logoutButton.title = "Logout"
        
        
        self.navigationItem.hidesBackButton = true;
        self.title = K.appName
        
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        
        self.tableView.register(UINib(nibName: K.cellNibName, bundle:nil), forCellReuseIdentifier: K.cellIdentifier)
        
        self.loadMessages()
    }
    
    func loadMessages() -> Void {
        messages = [];
        
        db.collection(K.FStore.collectionName).getDocuments { (querySnapshot, error) in
            if let e = error {
                print("There was an issue retrieving data from Firestore. \(e)")
            } else {
                
                if let safeDocuments = querySnapshot?.documents {
                    for document in safeDocuments {
                        let data = document.data()
                        if let sender = data[ K.FStore.senderField ] as? String, let message = data[ K.FStore.bodyField ] as? String {
                            self.messages.append(MessageModel(sender: sender, body: message))
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        if let messageBody = self.messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            
            db.collection(K.FStore.collectionName)
                .addDocument(data: [K.FStore.senderField: messageSender, K.FStore.bodyField: messageBody]) { (error) in
                    
                    if let e = error {
                        print("There was an issue saving data to firestore, \(e)")
                    } else {
                        print("Successfully saved data.")
                    }
                }
        }
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
