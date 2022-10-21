//
//  ApiResponse.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 21.10.2022.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
//
//// MARK: - DataClass
//struct DataClass: Codable {
//    let categories: [Category]
//    let populars, specials: [Popular]
//}
//
//// MARK: - Category
//struct Category: Codable {
//    let id, title: String
//    let image: String
//}
//
//// MARK: - Popular
//struct Popular: Codable {
//    let id, name, popularDescription: String
//    let image: String
//    let calories: Int
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case popularDescription = "description"
//        case image, calories
//    }
//}
