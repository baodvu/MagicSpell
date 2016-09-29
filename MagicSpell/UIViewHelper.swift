//
//  UIViewHelper.swift
//  MagicSpell
//
//  Created by Lingyi Li on 8/31/16.
//  Copyright © 2016 Georgia Tech. All rights reserved.
//

import UIKit
import CoreFoundation
import Foundation

extension UIView {
    
    var width:      CGFloat { return self.frame.size.width }
    var height:     CGFloat { return self.frame.size.height }
    var x:          CGFloat { return self.frame.origin.x }
    var y:          CGFloat { return self.frame.origin.y }
    var centerX:    CGFloat { return self.center.x }
    var centerY:    CGFloat { return self.center.y }
    
    var left:       CGFloat { return self.frame.origin.x }
    var right:      CGFloat { return self.frame.origin.x + self.frame.size.width }
    var top:        CGFloat { return self.frame.origin.y }
    var bottom:     CGFloat { return self.frame.origin.y + self.frame.size.height }
    
    func setWidth(_ width:CGFloat)
    {
        self.frame.size.width = width
    }
    
    func setHeight(_ height:CGFloat)
    {
        self.frame.size.height = height
    }
    
    func setX(_ x:CGFloat) //only change the origin x
    {
        self.frame.origin = CGPoint(x: x, y: self.frame.origin.y)
    }
    
    func setY(_ y:CGFloat) //only change the origin x
    {
        self.frame.origin = CGPoint(x: self.frame.origin.x, y: y)
    }
    
    func setCenterX(_ x:CGFloat) //only change the origin x
    {
        self.center = CGPoint(x: x, y: self.center.y)
    }
    
    func setCenterY(_ y:CGFloat) //only change the origin x
    {
        self.center = CGPoint(x: self.center.x, y: y)
    }
    
    func roundCorner(_ radius:CGFloat)
    {
        self.layer.cornerRadius = radius
    }
    
    func setTop(_ top:CGFloat)
    {
        self.frame.origin.y = top
    }
    
    func setLeft(_ left:CGFloat)
    {
        self.frame.origin.x = left
    }
    
    func setRight(_ right:CGFloat)
    {
        self.frame.origin.x = right - self.frame.size.width
    }
    
    func setBottom(_ bottom:CGFloat)
    {
        self.frame.origin.y = bottom - self.frame.size.height
    }

}

extension UIColor {
    static func Hexcolor(_ hexValue : NSInteger) -> UIColor {
        return UIColor.init(red: ((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0, green: ((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0, blue: ((CGFloat)(hexValue & 0xFF)) / 255.0, alpha: 1.0)
    }
    
    static func HexcolorA(_ hexValue : NSInteger, alphaValue: CGFloat) -> UIColor {
        return UIColor.init(red : ((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0, green : ((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0, blue : ((CGFloat)(hexValue & 0xFF)) / 255.0, alpha : (alphaValue))
    }

    static func appleBlue() -> UIColor {
        return UIColor.init(colorLiteralRed: 14.0/255, green: 122.0/255, blue: 254.0/255, alpha: 1.0)
    }
}
