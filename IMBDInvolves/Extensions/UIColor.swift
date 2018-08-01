//
//  UIColor.swift
//  IMDBInvolves
//
//  Created By Mateus on 02/11/17.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import UIKit

extension UIColor {
    /// Creates a UIColor from hexadecimal number.
    ///
    /// - Parameter value: Number in hexadecimal format, example: 0x54C6EB
    /// - Returns: The created UIColor.
    static func hex(value: UInt32) -> UIColor {
        let red = CGFloat((value & 0xFF0000) >> 16)
        let green = CGFloat((value & 0x00FF00) >> 8)
        let blue = CGFloat(value & 0x0000FF)
        return UIColor.rgba(red, green, blue)
    }

    /// Creates a UIColor with RGBA format with float numbers. No need for dividing by 255.
    ///
    /// - Parameters:
    ///   - r: red value
    ///   - g: green value
    ///   - b: blue value
    ///   - a: alpha value, defaults to 1
    /// - Returns: The created UIColor
    static func rgba(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}
