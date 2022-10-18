//
//  UIViewConproller + Ext.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 17.10.2022.
//

import UIKit

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instantiate()-> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}
