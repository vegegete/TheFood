//
//  ViewController.swift
//  TheFood
//
//  Created by Nenad Matic on 10/04/2020.
//  Copyright © 2020 Nenad Matic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var mealName: UITextField!
    
    @IBOutlet weak var mealDetails: UILabel!
    
    @IBAction func searchMeal(_ sender: UIButton) {
        parseJson(meal: mealName.text!)
    }
    
    func parseJson (meal: String) {
        
        if let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=\(meal)") {
        
        let urlSession = URLSession(configuration: .default)
        
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error)
            }
            
            if let safeData = data {
                if let result = self.decodeJSON(safeData) {
                DispatchQueue.main.async {
                    
                    self.mealDetails.text = """
                    This meal's full name is \(result.strMeal).
                    It is a \(result.strCategory) meal.
                    It's origin is \(result.strArea).
                    """
                    
                }
            }
            }
            
        }
             task.resume()
            
    }
        
       
        
    }
    
    
    func decodeJSON (_ model: Data) -> Meals? {
        
        do {
        let decodedData = try JSONDecoder().decode(MealModel.self, from: model)
            let name = decodedData.meals[0].strMeal
            let category = decodedData.meals[0].strCategory
            let origin = decodedData.meals[0].strArea
            
            let meal = Meals(strMeal: name, strCategory: category, strArea: origin)
            return meal
            
        } catch {
            print(error)
        }
        
        return nil
            
    }
}

