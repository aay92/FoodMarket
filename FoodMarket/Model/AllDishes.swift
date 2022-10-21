//
//  AllDishes.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 21.10.2022.
//

import Foundation

struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
