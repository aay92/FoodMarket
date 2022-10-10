//
//  OnBoardingCollectionViewCell.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 10.10.2022.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnBoardingCollectionViewCell.self)
    
    @IBOutlet weak var imageViewSlide: UIImageView!
    @IBOutlet weak var titleSlide: UILabel!
    @IBOutlet weak var descriptionSlide: UILabel!
    
    
    func setUp(_ slide: OnBoardingSlide){
        imageViewSlide.image = slide.image
        titleSlide.text = slide.title
        descriptionSlide.text = slide.description
        
    }
}
