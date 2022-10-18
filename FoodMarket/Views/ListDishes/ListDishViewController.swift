//
//  ListDishViewController.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 18.10.2022.
//

import UIKit

class ListDishViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var category: DishCategory!
    
    var dishes: [Dish] = [
        .init(id: "id1", name: "Special dish", description: "It is my lover dish", image:  "https://random.imagecdn.app/100/200", calories: 567.98),
        .init(id: "id2", name: "Special hot-dog", description: "The best what i try eat The best what i try eat The best what i try eat The best what i try eat The best what i try eat The best what i try eat The best what i try eat The best what i try eat The best", image:  "https://random.imagecdn.app/100/200", calories: 57.68),
        .init(id: "id3", name: "Wow Tako", description: "The best what i try eat", image:  "https://random.imagecdn.app/100/200", calories: 458.88)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.name
        registerCells()
    }
    
    private func registerCells(){
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}

extension ListDishViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count

    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
