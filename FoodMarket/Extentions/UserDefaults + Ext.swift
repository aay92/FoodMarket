//
//  UserDefaults + Ext.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 22.10.2022.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultsKeyString: String {
        case hasOnBoarded
    }
    
    var hasOnBoarded: Bool {
        get{
            bool(forKey: UserDefaultsKeyString.hasOnBoarded.rawValue)
        }
        set{
            setValue(newValue, forKey: UserDefaultsKeyString.hasOnBoarded.rawValue)
        }
    }
}
