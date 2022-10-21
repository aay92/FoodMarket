//
//  Route.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 19.10.2022.
//

import Foundation

enum Route {
    
    static let baseURL = "https://yummie.glitch.me/"
    
    case fetchAllCategories
    case placeOrder(String)
    case fetchCategoryDishes(String)
    
    var description: String {
        switch self {
        case .fetchAllCategories: return "/dish-categories"
        case .placeOrder(let dishId): return "/orders/\(dishId)"
        case .fetchCategoryDishes(let categoryId): return "/dishes/\(categoryId)"
        }
    }
}
