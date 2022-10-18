//
//  ListOrdersViewController.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 18.10.2022.
//

import UIKit

class ListOrdersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = [
        .init(id: "id1", name: "Alex", dish: .init(id: "id1", name: "Special dish", description: "It is my lover dish", image:  "https://random.imagecdn.app/100/200", calories: 567.98)),
        .init(id: "id2", name: "Yana", dish: .init(id: "id2", name: "Popular dish", description: "It is my lover dish", image:  "https://random.imagecdn.app/100/200", calories: 787.98))
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        registerCells()
    }

    private func registerCells(){
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}

extension ListOrdersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
}
