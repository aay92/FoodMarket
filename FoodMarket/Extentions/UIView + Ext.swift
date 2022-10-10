//
//  UIView + Ext.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 10.10.2022.
//

import Foundation
import UIKit

extension UIView {
   @IBInspectable var cornerRadius: CGFloat {
        get{ return cornerRadius }
        set{ self.layer.cornerRadius = newValue}
    }

}
