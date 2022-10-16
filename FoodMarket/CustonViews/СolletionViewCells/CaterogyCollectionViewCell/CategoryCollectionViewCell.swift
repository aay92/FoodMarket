//
//  CategoryCollectionViewCell.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 11.10.2022.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(category: DishCategory){
        categoryTitleLabel.text = category.name
        categoryImageView.kf.setImage(with: category.image?.asUrl)
    }
}
