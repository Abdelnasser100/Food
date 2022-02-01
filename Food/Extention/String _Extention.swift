//
//  String _Extention.swift
//  Food
//
//  Created by Abdelnasser on 15/09/2021.
//

import Foundation


extension String{
    var asURL:URL?{
        return URL(string: self)
    }
}
