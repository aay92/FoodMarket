//
//  ListDishViewController.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 18.10.2022.
//

import UIKit
import ProgressHUD

class ListDishViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var category: DishCategory!
    
    var dishes: [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.name
        registerCells()
        ProgressHUD.show()
        NetworkService.shared.categoryDishes(categoryId: category.id ?? "") {[weak self] (result) in
            switch result {
            case .success(let dishes):
                ProgressHUD.dismiss()
                self?.dishes = dishes
                self?.tableView.reloadData()
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
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
