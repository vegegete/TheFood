
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
}

 
 
/*

"strMeal": "Spicy Arrabiata Penne",
"strDrinkAlternate": null,
"strCategory": "Vegetarian",
"strArea": "Italian",
 
*/
