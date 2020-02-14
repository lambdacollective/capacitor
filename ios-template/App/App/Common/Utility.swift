//
//  Utility.swift
//  tesseract_prototype
//
//  Created by Jun Ho Hong on 8/6/19.
//  Copyright © 2019 Tesseract. All rights reserved.
//

import Foundation

class Utility {
    static func textHeight(_ text: String?, font: UIFont, andWidth width: CGFloat) -> CGFloat {
        let constrainedSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let attributes = [NSAttributedString.Key.font: font]
        let options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
        let bounds: CGRect? = text?.boundingRect(with: constrainedSize, options: options, attributes: attributes, context: nil)
        return CGFloat(ceilf(Float(bounds?.size.height ?? 0)))
    }
    static func jsonStringFrom(objects: Any?) -> String? {
        guard let objects = objects else {
            return nil
        }
        if let jsonData = try? JSONSerialization.data(withJSONObject: objects, options: []),
            let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue) {
            return jsonString as String
        }
        return nil
    }
    static func jsonFrom(string: String) -> [String: Any]? {
        let data = string.data(using: .utf8)!
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? Dictionary<String,Any>
            {
                return json
            } else {
                return nil
            }
        } catch let _ as NSError {
            return nil
        }
    }
    static func hexEncodedString(from data: Data) -> String {
        let hexDigits = Array("0123456789abcdef".utf16)
        var hexChars = [UTF16.CodeUnit]()
        hexChars.reserveCapacity(data.count * 2)
        
        for byte in data {
            let (index1, index2) = Int(byte).quotientAndRemainder(dividingBy: 16)
            hexChars.append(hexDigits[index1])
            hexChars.append(hexDigits[index2])
        }
        
        return String(utf16CodeUnits: hexChars, count: hexChars.count)
    }
}
