//
//  DishDetailsViewController.swift
//  Food
//
//  Created by Abdelnasser on 17/09/2021.
//

import UIKit
import ProgressHUD

class DishDetailsViewController: UIViewController {

    
    @IBOutlet weak var DishImageView: UIImageView!
    @IBOutlet weak var titelLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var describtionLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      popularteView()
    }
    
    private func popularteView(){
        DishImageView.kf.setImage(with: dish.image?.asURL)
        titelLabel.text = dish.name
        caloriesLabel.text = dish.formattedCalories
        describtionLabel.text = dish.description

    }

    @IBAction func placeOrderBrn(_ sender: UIButton) {
        guard let name = nameTextField.text?.trimmingCharacters(in: .whitespaces),!name.isEmpty else {
            ProgressHUD.showError("Please enter your name")
            return
        }
        
        ProgressHUD.show("Placing Order ...")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name){(result)in
            switch result{
            case .success(_):
                ProgressHUD.showSuccess("Your order has been reseved.")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
            
        }
        
    }
    
    

}
