//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]();
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist");
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        print("Data File Path: \(dataFilePath)");
        
        self.loadItems()
        
    }
    
    // MARK: - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemArray.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[ indexPath.row ];
        
        cell.textLabel?.text = item.title;
        
        cell.accessoryType = item.done ? .checkmark : .none;
        
        return cell;
    }
    
    // MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did Select Option: \(self.itemArray[ indexPath.row])" )
        
        
        itemArray[ indexPath.row ].done = !itemArray[ indexPath.row ].done;
        self.saveItems();
        
        // Forces the table to call the DataSource
        self.tableView.reloadData();
        
        tableView.deselectRow(at: indexPath, animated: true);
    }
    
    // MARK: - Actions
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField();
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert);
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            print("Success: \(textField.text)");
            
            if let safeString = textField.text {
                
                let newItem = Item();
                newItem.title = safeString;
                
                self.itemArray.append(newItem);
                
                self.saveItems();
                
                self.tableView.reloadData();
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil);
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Item";
            textField = alertTextField;
            
            print(alertTextField.text)
        }
        
        alert.addAction(cancelAction);
        alert.addAction(action);
        
        present(alert, animated: true, completion: nil);
    }
    
    // MARK: Data Persistence Methods
    func saveItems() {
        let encoder = PropertyListEncoder();
        
        do {
            let data = try encoder.encode(self.itemArray);
            try data.write(to: self.dataFilePath!)
        } catch {
            print("Error encoding item array, \(error)");
        }
    }
    
    func loadItems() {
        
        let data = try? Data(contentsOf: dataFilePath!);
        
        if let safeData = data {
            let decoder = PropertyListDecoder();
            
            do {
                
                self.itemArray = try decoder.decode([Item].self, from: safeData);
                
                self.tableView.reloadData();
            } catch {
                print("Threw an error, \(error)")
            }
            
            
        }
        
        
    }
}

