//
//  ViewController.swift
//  TheFood
//
//  Created by Nenad Matic on 10/04/2020.
//  Copyright © 2020 Nenad Matic. All rights reserved.
//

import UIKit

//protocol Meal {
//    func fetchMealInfo(_ meal: MealResultModel)
//}

class ViewController: UIViewController {
    
    let backgroundImage = UIImageView()
    
    func setSearchButtonLook () {
        searchButton.backgroundColor = .red
        searchButton.layer.cornerRadius = 20
        searchButton.layer.borderWidth = 1
        searchButton.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBOutlet weak var recipeButton: UIButton!
    
    func setRecipeButtonEdges () {
         
         recipeButton.layer.cornerRadius = 25
         recipeButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
         
     }
    
    @IBAction func goToRecipe(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToTable", sender: self)
    }
    
    
    func setBackgroundImage() {
        view.addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImage.contentMode = .scaleAspectFill
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRecipeButtonEdges()
        setSearchButtonLook()
        setBackgroundImage()
    }
    
    
    //var delegate: Meal?
    
    var resultingData: MealResultModel?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? MealTableTableViewController {
            if let res = resultingData {
                destinationVC.result = res
            }
        }
    }

    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var mealName: UITextField!
    
    @IBOutlet weak var mealDetails: UILabel!
    
    @IBAction func searchMeal(_ sender: UIButton) {
        parseJson(meal: mealName.text!)
    }
    
    func parseJson (meal: String) {
        var mealStripped = meal
        if meal.contains(" ") {
            mealStripped.removeAll(where: {$0 == " "})
        }
        if let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=\(mealStripped)") {
            
            let urlSession = URLSession(configuration: .default)
            
            urlSession.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                }
                
                if let safeData = data {
                    if let result = self.decodeJSON(safeData) {
                        self.resultingData = MealResultModel(name: result.strMeal, category: result.strCategory, origin: result.strArea)
                        
                        DispatchQueue.main.async {
                            
                            self.mealDetails.text = """
                            This meal's full name is \(result.strMeal).
                            It is a \(result.strCategory) meal.
                            It's origin is \(result.strArea).
                            """
                            let imageURL = URL(string: result.strMealThumb)
                            let imageData = try? Data(contentsOf: imageURL!)
                            let mealImage = UIImage(data: imageData!)!
                            self.backgroundImage.image = mealImage
                            self.view.sendSubviewToBack(self.backgroundImage)
                        }
                        
                    }
                    
                }
                
            }.resume()
            
        }
        
    }
    
    func decodeJSON (_ model: Data) -> Meals? {
        
        do {
            let decodedData = try JSONDecoder().decode(MealModel.self, from: model)
            let name = decodedData.meals[0].strMeal
            let category = decodedData.meals[0].strCategory
            let origin = decodedData.meals[0].strArea
            let imageURL = decodedData.meals[0].strMealThumb
            
            let meal = Meals(strMeal: name, strCategory: category, strArea: origin, strMealThumb: imageURL)
            return meal
            
        } catch {
            print(error)
        }
        
        return nil
        
    }
 
}

