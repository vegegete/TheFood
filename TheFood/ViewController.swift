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
                        self.resultingData = MealResultModel(name: result.strMeal, category: result.strCategory, origin: result.strArea, ingridient1: result.strIngredient1, ingridient2: result.strIngredient2, ingridient3: result.strIngredient3, ingridient4: result.strIngredient4, ingridient5: result.strIngredient5, ingridient6: result.strIngredient6, ingridient7: result.strIngredient7, ingridient8: result.strIngredient8, ingridient9: result.strIngredient9, ingridient10: result.strIngredient10, ingridient11: result.strIngredient11, ingridient12: result.strIngredient12, ingridient13: result.strIngredient13, ingridient14: result.strIngredient14, ingridient15: result.strIngredient15, ingridient16: result.strIngredient16, ingridient17: result.strIngredient17, ingridient18: result.strIngredient18, ingridient19: result.strIngredient19, ingridient20: result.strIngredient20)
                        
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
            let ingridient1 = decodedData.meals[0].strIngredient1
            let ingridient2 = decodedData.meals[0].strIngredient2
            let ingridient3 = decodedData.meals[0].strIngredient3
            let ingridient4 = decodedData.meals[0].strIngredient4
            let ingridient5 = decodedData.meals[0].strIngredient5
            let ingridient6 = decodedData.meals[0].strIngredient6
            let ingridient7 = decodedData.meals[0].strIngredient7
            let ingridient8 = decodedData.meals[0].strIngredient8
            let ingridient9 = decodedData.meals[0].strIngredient9
            let ingridient10 = decodedData.meals[0].strIngredient10
            let ingridient11 = decodedData.meals[0].strIngredient11
            let ingridient12 = decodedData.meals[0].strIngredient12
            let ingridient13 = decodedData.meals[0].strIngredient13
            let ingridient14 = decodedData.meals[0].strIngredient14
            let ingridient15 = decodedData.meals[0].strIngredient15
            let ingridient16 = decodedData.meals[0].strIngredient16
            let ingridient17 = decodedData.meals[0].strIngredient17
            let ingridient18 = decodedData.meals[0].strIngredient18
            let ingridient19 = decodedData.meals[0].strIngredient19
            let ingridient20 = decodedData.meals[0].strIngredient20
            
            let meal = Meals(strMeal: name, strCategory: category, strArea: origin, strMealThumb: imageURL, strIngredient1: ingridient1, strIngredient2: ingridient2, strIngredient3: ingridient3, strIngredient4: ingridient4, strIngredient5: ingridient5, strIngredient6: ingridient6, strIngredient7: ingridient7, strIngredient8: ingridient8, strIngredient9: ingridient9, strIngredient10: ingridient10, strIngredient11: ingridient11, strIngredient12: ingridient12, strIngredient13: ingridient13, strIngredient14: ingridient14, strIngredient15: ingridient15, strIngredient16: ingridient16, strIngredient17: ingridient17, strIngredient18: ingridient18, strIngredient19: ingridient19, strIngredient20: ingridient20)
            return meal
            
        } catch {
            print(error)
        }
        
        return nil
        
    }
 
}

