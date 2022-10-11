//
//  String + Ext.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 11.10.2022.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
