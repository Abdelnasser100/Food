//
//  OnborderSingleCollectionViewCell.swift
//  Food
//
//  Created by Abdelnasser on 14/09/2021.
//

import UIKit

class OnborderSingleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnborderSingleCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitelLabel: UILabel!
    @IBOutlet weak var slideDescribtionLabel: UILabel!
    
    
    func setUp(_ slide:OnborderSlide) {
    
        slideImageView.image = slide.image
        slideTitelLabel.text = slide.titel
        slideDescribtionLabel.text = slide.dscribtion
    }
}
