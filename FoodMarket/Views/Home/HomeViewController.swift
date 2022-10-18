//
//  HomeViewController.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 11.10.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var specialCollectionView: UICollectionView!
    
    var categores: [DishCategory] = [
        .init(id: "id1", name: "Columb Dish", image: "https://random.imagecdn.app/100/200"),
        .init(id: "id1", name: "Africa Dish", image: "https://random.imagecdn.app/100/200"),
        .init(id: "id1", name: "Russian Dish", image: "https://random.imagecdn.app/100/200"),
        .init(id: "id1", name: "USA Dish", image: "https://random.imagecdn.app/100/200"),
        .init(id: "id1", name: "Mexica Dish", image: "https://random.imagecdn.app/100/200")
    ]
    
    var populars: [Dish] = [
        .init(id: "id1", name: "Pizza", description: "The best what i try eat", image:  "https://random.imagecdn.app/100/200", calories: 56.98),
        .init(id: "id2", name: "hot-dog", description: "The best what i try eat", image:  "https://random.imagecdn.app/100/200", calories: 577.68),
        .init(id: "id3", name: "Tako", description: "The best what i try eat", image:  "https://random.imagecdn.app/100/200", calories: 45.88)
    ]
    
    var specials: [Dish] = [
        .init(id: "id1", name: "Special dish", description: "It is my lover dish", image:  "https://random.imagecdn.app/100/200", calories: 567.98),
        .init(id: "id2", name: "Special hot-dog", description: "The best what i try eat The best what i try eat The best what i try eat The best what i try eat The best what i try eat The best what i try eat The best what i try eat The best what i try eat The best what i try eat The best what i try eat The best what i try eat The best what i try eat The best what i try eat The best what i try eat The best what i try eat The best what i try eat The best what i try eat The best what i try eat", image:  "https://random.imagecdn.app/100/200", calories: 57.68),
        .init(id: "id3", name: "Wow Tako", description: "The best what i try eat", image:  "https://random.imagecdn.app/100/200", calories: 458.88)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    
    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil),forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularCollectionView.register(UINib(nibName: PortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PortraitCollectionViewCell.identifier)
        
        specialCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categores.count
        case popularCollectionView:
            return populars.count
        case specialCollectionView:
            return specials.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setUp(category: categores[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PortraitCollectionViewCell.identifier, for: indexPath) as! PortraitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
        case specialCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setUp(dish: specials[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishViewController.instantiate()
            controller.category = categores[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)

        } else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}

