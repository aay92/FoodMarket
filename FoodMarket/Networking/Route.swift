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
    
    var description: String {
        switch self {
        case .fetchAllCategories: return "/dish-categories"
        }
    }
}
