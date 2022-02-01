//
//  UIView_Extention.swift
//  Food
//
//  Created by Abdelnasser on 14/09/2021.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
