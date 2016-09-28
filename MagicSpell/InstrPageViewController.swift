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
    
    @IBOutlet weak var openKeyboardSettingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openKeyboardSettingsButton.layer.borderColor = UIColor.darkGrayColor().CGColor
    }
    
    override func viewDidAppear(animated: Bool) {
        if KeyboardActivation.isKeyboardActivated() {
            let myView = (self.storyboard?.instantiateViewControllerWithIdentifier("switchKeyboard"))! as UIViewController
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.window?.rootViewController = myView
        }
    }
    
    @IBAction func openKeyboardSettings(sender: UIButton) {
        let keyboardSettingsURL = NSURL(string: "prefs:root=General&path=Keyboard/KEYBOARDS")
        UIApplication.sharedApplication().openURL(keyboardSettingsURL!)
    }
    
}
