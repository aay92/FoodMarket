//
//  CardView.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 12.10.2022.
//

import UIKit

class CardView: UIView {
    override init(frame: CGRect) {
        super .init(frame: frame)
        initialSetUp()

    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        initialSetUp()
    }
    
    private func initialSetUp(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.15
        layer.shadowRadius = 5
        cornerRadius = 10
    }
}
