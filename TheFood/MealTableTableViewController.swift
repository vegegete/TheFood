//
//  MealTableTableViewController.swift
//  TheFood
//
//  Created by Nenad Matic on 11/04/2020.
//  Copyright © 2020 Nenad Matic. All rights reserved.
//

import UIKit

class MealTableTableViewController: UITableViewController {
    
 
    var result: MealResultModel = MealResultModel(name: "", category: "", origin: "") {
        willSet {
         
            resultArray.append(newValue.name!)
            resultArray.append(newValue.category!)
            resultArray.append(newValue.origin!)

        }
    }
    
    
    var resultArray = [String]()

        
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
 

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell", for: indexPath)
        
      
        cell.textLabel?.text = resultArray[indexPath.row]
       
        return cell
        
    }
    
}
