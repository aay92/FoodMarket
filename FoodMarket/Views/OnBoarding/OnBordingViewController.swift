//
//  OnBoardingViewController.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 10.10.2022.
//

import UIKit

class OnBoardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var buttonNext: UIButton!
    
    var slides: [OnBoardingSlide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = [OnBoardingSlide(title: "Быстрая доставка до двери",
                                  description: "Быстрая доставка до твоей квартиры",
                                  image: #imageLiteral(resourceName: "slide1")),
                  OnBoardingSlide(title: "Ежедневные акции и кэшбек",
                                  description: "Для постоянных клиентов доступен кэшбек с покупок",
                                  image: #imageLiteral(resourceName: "slide2")),
                  OnBoardingSlide(title: "Лучший ассортимент",
                                  description: "Большое количество встроенных рецептов для наших пользователей ",
                                  image: #imageLiteral(resourceName: "slide3"))
        ]
    }
    

    @IBAction func actionButtonNext(_ sender: Any) {
    }
}

extension OnBoardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:OnBoardingCollectionViewCell.identifier, for: indexPath) as! OnBoardingCollectionViewCell
        cell.setUp(slides[indexPath.row])
        return cell
    }
    
    
}
