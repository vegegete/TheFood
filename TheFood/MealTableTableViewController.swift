//
//  MealTableTableViewController.swift
//  TheFood
//
//  Created by Nenad Matic on 11/04/2020.
//  Copyright © 2020 Nenad Matic. All rights reserved.
//

import UIKit

class MealTableTableViewController: UITableViewController {
    
 
    var result: MealResultModel? {
        willSet {
         
            resultArray.append((newValue?.ingridient1) ?? "")
            resultArray.append((newValue?.ingridient2) ?? "")
            resultArray.append((newValue?.ingridient3) ?? "")
            resultArray.append((newValue?.ingridient4) ?? "")
            resultArray.append((newValue?.ingridient5) ?? "")
            resultArray.append((newValue?.ingridient6) ?? "")
            resultArray.append((newValue?.ingridient7) ?? "")
            resultArray.append((newValue?.ingridient8) ?? "")
            resultArray.append((newValue?.ingridient9) ?? "")
            resultArray.append((newValue?.ingridient10) ?? "")
            resultArray.append((newValue?.ingridient11) ?? "")
            resultArray.append((newValue?.ingridient12) ?? "")
            resultArray.append((newValue?.ingridient13) ?? "")
            resultArray.append((newValue?.ingridient14) ?? "")
            resultArray.append((newValue?.ingridient15) ?? "")
            resultArray.append((newValue?.ingridient16) ?? "")
            resultArray.append((newValue?.ingridient17) ?? "")
            resultArray.append((newValue?.ingridient18) ?? "")
            resultArray.append((newValue?.ingridient19) ?? "")
            resultArray.append((newValue?.ingridient20) ?? "")

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
