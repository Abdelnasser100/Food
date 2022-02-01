//
//  DishListTableViewCell.swift
//  Food
//
//  Created by Abdelnasser on 18/09/2021.
//

import UIKit

class DishListTableViewCell: UITableViewCell {
    
    static let identifir = "DishListTableViewCell"
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titelLabel: UILabel!
    @IBOutlet weak var describtionLabel: UILabel!
    
    func setup(dish:Dish) {
    
        dishImageView.kf.setImage(with: dish.image?.asURL)
        titelLabel.text = dish.name
        describtionLabel.text = dish.description
    }
    
    func setup(order:Order) {
        dishImageView.kf.setImage(with: order.dish?.image?.asURL)
        titelLabel.text = order.dish?.name
        describtionLabel.text = order.name
        
    }
}
