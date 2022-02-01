//
//  Order.swift
//  Food
//
//  Created by Abdelnasser on 19/09/2021.
//

import Foundation

struct Order:Decodable {
    
    let id:String?
    let name:String?
    let dish:Dish?
}
