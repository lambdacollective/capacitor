//
//  UIColor+Hex.swift
//  tesseract_prototype
//
//  Created by Jun Ho Hong on 7/11/19.
//  Copyright © 2019 Tesseract. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    /**
     RGB to UIColor.
     - parameters:
     - red: Red value.
     - green: Green value.
     - blue: Blue value.
     */
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    /**
     Hex to UIColor.
     - parameter hex: Hex value of the color.
     */
    convenience init(hex: Int) {
        self.init(red: (hex >> 16) & 0xff, green: (hex >> 8) & 0xff, blue: hex & 0xff)
    }
    
}
