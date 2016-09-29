//
//  KeyboardActivation.swift
//  MagicSpell
//
//  Created by Bao Vu on 9/22/16.
//  Copyright © 2016 Georgia Tech. All rights reserved.
//

import Foundation

class KeyboardActivation {
    static let bundleId = "edu.gatech.cc.pentagon.MagicSpell"
    
    static func isKeyboardActivated() -> Bool {
        let array = UserDefaults.standard.object(forKey: "AppleKeyboards") as! [String]
        for keyboard in array {
            if keyboard.contains(bundleId) {
                return true
            }
        }
        return false
    }
}
