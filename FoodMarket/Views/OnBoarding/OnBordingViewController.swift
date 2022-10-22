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
    var currentPage = 0 {
        didSet {
            pageController.currentPage = currentPage
            if currentPage == slides.count - 1 {
                buttonNext.setTitle("Начать", for: .normal)
            } else {
                buttonNext.setTitle("Cледущий", for: .normal)
            }
        }
    }
    
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
        pageController.numberOfPages = slides.count
    }
    

    @IBAction func actionButtonNext(_ sender: Any) {
        if currentPage == slides.count - 1 {
            //        добавляю view controller
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController
            //            стиль перехода = полный экран
            controller.modalPresentationStyle = .fullScreen
            //            анимированый переход на главную страницу
            controller.modalTransitionStyle = .flipHorizontal
            UserDefaults.standard.hasOnBoarded = true
            //            переход на controller
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension OnBoardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:OnBoardingCollectionViewCell.identifier, for: indexPath) as! OnBoardingCollectionViewCell
        cell.setUp(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageController.currentPage = currentPage
    }
    
}
