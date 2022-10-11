//
//  HomeViewController.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 11.10.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categores: [DishCategory] = [
        .init(id: "id1", name: "Columb Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Russian Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "USA Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Mexica Dish", image: "https://picsum.photos/100/200")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
