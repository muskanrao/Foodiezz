//
//  UIViewExtensiom.swift
//  Foodiezz
//
//  Created by Muskan on 27/06/22.
//

import Foundation
import UIKit
// to carete a corner radius property in iboutlet

extension UIView {
     
    @IBInspectable  var cornerRadius: CGFloat {
        get{
            return self.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
    
}
