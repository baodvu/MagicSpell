//
//  KeyboardActivation.swift
//  MagicSpell
//
//  Created by Bao Vu on 9/22/16.
//  Copyright © 2016 Georgia Tech. All rights reserved.
//

import Foundation

class KeyboardActivation {
    static let bundleId = "edu.gatech.cc.bvu.MagicSpell"
    
    static func isKeyboardActivated() -> Bool {
        let array = NSUserDefaults.standardUserDefaults().objectForKey("AppleKeyboards") as! [String]
        for keyboard in array {
            if keyboard.containsString(bundleId) {
                return true
            }
        }
        return false
    }
}