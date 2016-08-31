//
//  MacroFunction.swift
//  MagicSpell
//
//  Created by Lingyi Li on 8/31/16.
//  Copyright © 2016 Georgia Tech. All rights reserved.
//

import Foundation

func Hexcolor(hexValue : NSInteger) -> UIColor {
    return UIColor.init(red: ((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0, green: ((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0, blue: ((CGFloat)(hexValue & 0xFF)) / 255.0, alpha: 1.0)
}

func HexcolorA(hexValue : NSInteger, alphaValue: CGFloat) -> UIColor {
    return UIColor.init(red : ((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0, green : ((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0, blue : ((CGFloat)(hexValue & 0xFF)) / 255.0, alpha : (alphaValue))
}
