//
//  PortraitCollectionViewCell.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 16.10.2022.
//

import UIKit
import Kingfisher

class PortraitCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: PortraitCollectionViewCell.self)
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func setup(dish: Dish){
        titleLbl.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
        
    }
}
