
//
//  DataModel.swift
//  TheFood
//
//  Created by Nenad Matic on 10/04/2020.
//  Copyright © 2020 Nenad Matic. All rights reserved.
//

import UIKit

struct MealModel: Codable {
    var meals: [Meals]
}

struct Meals: Codable {
    var strMeal: String
    var strCategory: String
    var strArea: String
    var strMealThumb: String
    
    //ingridients
    
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12:String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strIngredient16: String?
    var strIngredient17: String?
    var strIngredient18: String?
    var strIngredient19: String?
    var strIngredient20: String?
}


//"strIngredient1": "Lentils",
//"strIngredient2": "Onion",
//"strIngredient3": "Carrots",
//"strIngredient4": "Tomato Puree",
//"strIngredient5": "Cumin",
//"strIngredient6": "Paprika",
//"strIngredient7": "Mint",
//"strIngredient8": "Thyme",
//"strIngredient9": "Black Pepper",
//"strIngredient10": "Red Pepper Flakes",
//"strIngredient11": "Vegetable Stock",
//"strIngredient12": "Water",
//"strIngredient13": "Sea Salt",
//"strIngredient14": "",
//"strIngredient15": "",
//"strIngredient16": "",
//"strIngredient17": "",
//"strIngredient18": "",
//"strIngredient19": "",
//"strIngredient20": "",
