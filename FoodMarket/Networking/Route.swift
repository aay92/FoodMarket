//
//  Route.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 19.10.2022.
//

import Foundation

enum Route {
    
    static let baseURL = "https://yummie.glitch.me/"
    
    case temp
    
    var description: String {
        switch self {
        case .temp: return "/temp"
        }
    }
}
