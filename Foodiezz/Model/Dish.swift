//
//  Dish.swift
//  Foodiezz
//
//  Created by Muskan on 28/06/22.
//

import Foundation



struct Dish{
    
    let id: String
    let name: String
    let description: String
    let image: String
    let calories: Double
    let price: Int
    
    var formattedCalories: String{
        
        return String(format: "%.2f", calories)
        
    }
    
}
