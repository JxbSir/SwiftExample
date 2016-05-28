//
//  UIColor+Hex.swift
//  BuySms
//
//  Created by Peter on 16/5/28.
//  Copyright © 2016年 Peter. All rights reserved.
//

import Foundation

public extension UIColor {
    public static func HexColor(hexValue:Int64) -> UIColor {
        return HexColor(hexValue, alpha: 1)
    }
    
    public static func HexColor(hexValue:Int64, alpha:Float) -> UIColor {
        let r = (hexValue & 0xFF0000) >> 16
        let g = (hexValue & 0xFF00) >> 8
        let b = (hexValue & 0xFF)
        
        let color = UIColor.init(colorLiteralRed: Float(r) / 255.0, green: Float(g) / 255.0, blue: Float(b) / 255.0, alpha: alpha)
        return color
    }
}