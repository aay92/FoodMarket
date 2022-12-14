//
//  Order.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 18.10.2022.
//

import Foundation

struct Order: Decodable {
    let id: String?
    let name: String?
    let dish: Dish?
}
