//
//  PopularDishCollectionViewCell.swift
//  Food
//
//  Created by Abdelnasser on 16/09/2021.
//

import UIKit
import Kingfisher

class PopularDishCollectionViewCell: UICollectionViewCell {
 
    static let identifir = "PopularDishCollectionViewCell"
    
    @IBOutlet weak var DishPupularName: UILabel!
    @IBOutlet weak var DishImageView: UIImageView!
    @IBOutlet weak var Calories: UILabel!
    @IBOutlet weak var describtionLabel: UILabel!
    
    func setUp(dish:Dish) {
        
        DishPupularName.text = dish.name
        DishImageView.kf.setImage(with: dish.image?.asURL)
        Calories.text = dish.formattedCalories
        describtionLabel.text = dish.description
        
    }
}
