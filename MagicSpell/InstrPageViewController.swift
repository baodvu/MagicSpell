//
//  InstrPageViewController.swift
//  MagicSpell
//
//  Created by Lingyi Li on 8/31/16.
//  Copyright © 2016 Georgia Tech. All rights reserved.
//

import UIKit
import Foundation

class InstrPageViewController: UIViewController{
    
    static let nextScreen = SwitchKeyboardViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if KeyboardActivation.isKeyboardActivated() {
            let myView = (self.storyboard?.instantiateViewController(withIdentifier: "switchKeyboard"))! as UIViewController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = myView
        }
    }
}
