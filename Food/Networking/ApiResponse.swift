//
//  ApiResponse.swift
//  Food
//
//  Created by Abdelnasser on 21/09/2021.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
