//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Miguel Solans on 26/04/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
    var categories = [Category]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        self.loadCategories();
    }

    @IBAction func addButtonClicked(_ sender: Any) {
        let alert = UIAlertController(title: "New Category", message: "", preferredStyle: .alert);
        
        var textField = UITextField()
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil);
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            print("Category Name typed in: \(textField.text)");
            
            if let category = textField.text {
                let newCategory = Category(context: self.context);
                newCategory.name = category;
                
                self.categories.append(newCategory);
                
                self.saveCategories();
            }
        };
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Item";
            textField = alertTextField;
        }
        
        alert.addAction(cancelAction);
        alert.addAction(addAction);
        
        self.present(alert, animated: true, completion: nil);
    }
    
    // MARK: - TableView Datasource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count;
    }
    
    // MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath);
        
        
        cell.textLabel?.text = self.categories[ indexPath.row ].name;
        
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "goToItems", sender: self);
    }
    
    // MARK: - Data Manipulation Methods
    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        do {
            self.categories = try self.context.fetch(request);
            
            self.tableView.reloadData();
        } catch {
            print("Got an error, \(error)")
        }
    }
    
    func saveCategories() {
        do {
            
            try self.context.save()
            
            self.tableView.reloadData();
            
        } catch {
            print("Error fetching data, \(error)")
        }
    }
    
    // MARK: - Segue Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! TodoListViewController;
        
        // Grab the Category for the Cell
        if let indexPath = self.tableView.indexPathForSelectedRow {
            
            // Fetch Data for that Category
            destinationViewController.selectedCategory = self.categories[ indexPath.row ];
            
        }
        
    }
    

}
