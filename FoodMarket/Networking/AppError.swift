//
//  AppError.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 21.10.2022.
//

import Foundation
 
enum AppError: LocalizedError {
    
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "I have no idea what go on"
        case .invalidUrl:
            return "Give me a valid URL"
        case .serverError( let error):
            return error
        }
    }
}
