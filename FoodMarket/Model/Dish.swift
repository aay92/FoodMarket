//
//  Dish.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 16.10.2022.
//

import Foundation

struct Dish {
    let id: String?
    let name: String?
    let description: String?
    let image: String?
    let calories: Double?
    
    var formattedCalories: String {
        return String(format: "%.2f calories", calories ?? 0)
    }
}
