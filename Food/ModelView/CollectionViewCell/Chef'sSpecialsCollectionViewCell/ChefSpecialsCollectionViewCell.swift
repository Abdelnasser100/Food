//
//  ChefSpecialsCollectionViewCell.swift
//  Food
//
//  Created by Abdelnasser on 16/09/2021.
//

import UIKit

class ChefSpecialsCollectionViewCell: UICollectionViewCell {

    static let identifir = "ChefSpecialsCollectionViewCell"
    
    @IBOutlet weak var chefImageView: UIImageView!
    @IBOutlet weak var titelLabel: UILabel!
    @IBOutlet weak var describtionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    
    func setup(dish:Dish) {
        chefImageView.kf.setImage(with: dish.image?.asURL)
        
        titelLabel.text = dish.name
        describtionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
    }

}
