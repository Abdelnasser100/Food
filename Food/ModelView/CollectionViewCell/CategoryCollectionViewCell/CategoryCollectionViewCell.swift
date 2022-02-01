//
//  CategoryCollectionViewCell.swift
//  Food
//
//  Created by Abdelnasser on 15/09/2021.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    static let identifir = String(describing: CategoryCollectionViewCell.self)

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
   
    func setUP(category:Category) {
    
        categoryNameLabel.text = category.title
        categoryImageView.kf.setImage(with: category.image.asURL)
    }

}
