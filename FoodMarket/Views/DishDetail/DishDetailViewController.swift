//
//  DishDetailViewController.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 17.10.2022.
//

import UIKit
import Kingfisher
import ProgressHUD

class DishDetailViewController: UIViewController {
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()

    }
    
    private func populateView(){
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
    }
    
    @IBAction func actionOrderButton(_ sender: Any) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            ProgressHUD.showError("Пожалуйста введите свое имя")
            return
        }
        ProgressHUD.show("Заказ...")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name) { [weak self](result) in
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("Ваш заказ получен!👨‍🍳")
                self!.nameField.text = ""

            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }

        }
    }
    
    
}
