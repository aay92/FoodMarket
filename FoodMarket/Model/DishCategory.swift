//
//  File.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 11.10.2022.
//

import Foundation

struct DishCategory: Decodable {
    let id, name, image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}
