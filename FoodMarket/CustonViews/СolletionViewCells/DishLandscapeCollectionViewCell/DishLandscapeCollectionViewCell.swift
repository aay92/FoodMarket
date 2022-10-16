//
//  DishLandscapeCollectionViewCell.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 16.10.2022.
//

import UIKit
import Kingfisher

class DishLandscapeCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: DishLandscapeCollectionViewCell.self)

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    
    func setUp(dish: Dish){
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }
}
