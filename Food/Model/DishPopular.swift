//
//  DishPopular.swift
//  Food
//
//  Created by Abdelnasser on 16/09/2021.
//

import Foundation

struct Dish:Decodable {
    
    let id ,name,description,image:String?
    let calories:Double?
    
    var formattedCalories:String{
        return String(format: "%2f", calories ?? 0)
    }
}
