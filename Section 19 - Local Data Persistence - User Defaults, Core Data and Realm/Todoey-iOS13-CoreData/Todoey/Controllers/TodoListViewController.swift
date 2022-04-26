//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreData;

class TodoListViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    var itemArray = [Item]();
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask);
        
        print("Data File Path: \(dataFilePath)");
        
        self.searchBar.delegate = self;
        
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
        
        /*
        context.delete(itemArray[ indexPath.row ]);
        itemArray.remove(at: indexPath.row );
        */
        
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
            
            if let safeString = textField.text {
                
                let newItem = Item(context: self.context);
                newItem.title = safeString;
                newItem.done = false;
                
                self.saveItems();
                
                self.loadItems();
                
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
            try self.context.save();
        } catch {
            print("Error Saving Context, \(error)");
        }
    }
    
    // request has default value returned by Item.fetchRequest()
    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest()) {
        
        do {
            
            self.itemArray = try self.context.fetch(request);
            
            self.tableView.reloadData();
            
        } catch {
            print("Error fetching data, \(error)")
        }
    }
}

extension TodoListViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request : NSFetchRequest<Item> = Item.fetchRequest();
        
        print("Searching for \(searchBar.text!)");
        
        
        // Query
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!);
        
        request.predicate = predicate;
        
        let sortDescripor = NSSortDescriptor(key: "title", ascending: true);
        
        request.sortDescriptors = [sortDescripor];
        
        self.loadItems(with: request);
        

    }
}

