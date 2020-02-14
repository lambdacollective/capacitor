//
//  Fonts.swift
//  tesseract_prototype
//
//  Created by Jun Ho Hong on 7/11/19.
//  Copyright © 2019 Tesseract. All rights reserved.
//

import Foundation
import UIKit

fileprivate enum FontName: String {
    case extraBold = "Poppins-ExtraBold"
    case black = "Poppins-Black"
    case bold = "Poppins-Bold"
    case semiBold = "Poppins-SemiBold"
    case regular = "Poppins-Regular"
    case light = "Poppins-Light"
    
    var errorMessage: String {
        return "Error: couldn't display font for \(self.rawValue)"
    }
}

extension UIFont {
    fileprivate convenience init?(_ name: FontName, size: CGFloat) {
        self.init(name: name.rawValue, size: size)
    }
}

class Fonts {
    static func extraBold(_ size: CGFloat) -> UIFont {
        return UIFont(.extraBold, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    static func black(_ size: CGFloat) -> UIFont {
        return UIFont(.black, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    static func bold(_ size: CGFloat) -> UIFont {
        return UIFont(.bold, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    static func regular(_ size: CGFloat) -> UIFont {
        return UIFont(.regular, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    static func semiBold(_ size: CGFloat) -> UIFont {
        return UIFont(.semiBold, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    static func light(_ size: CGFloat) -> UIFont {
        return UIFont(.light, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
