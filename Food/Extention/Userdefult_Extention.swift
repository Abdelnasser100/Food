//
//  Userdefult_Extention.swift
//  Food
//
//  Created by Abdelnasser on 21/09/2021.
//

import Foundation
extension UserDefaults{
    private enum UserDefaultsKeys:String{
        case hasOnborded
    }
    
    var hasOnborded:Bool{
        get{
            bool(forKey: UserDefaultsKeys.hasOnborded.rawValue)
        }
        set{
            setValue(newValue, forKey: UserDefaultsKeys.hasOnborded.rawValue)
        }
    }
}
