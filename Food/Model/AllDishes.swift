//
//  AllDishes.swift
//  Food
//
//  Created by Abdelnasser on 21/09/2021.
//

import Foundation

struct AllDishes:Decodable {

    let categories:[Category]?
    let populars:[Dish]?
    let specials:[Dish]?

}
