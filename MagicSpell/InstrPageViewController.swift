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
        
        openKeyboardSettingsButton.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if KeyboardActivation.isKeyboardActivated() {
            let myView = (self.storyboard?.instantiateViewController(withIdentifier: "switchKeyboard"))! as UIViewController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = myView
        }
    }
    
    @IBAction func openKeyboardSettings(_ sender: UIButton) {
        let keyboardSettingsURL = URL(string: "prefs:root=General&path=Keyboard/KEYBOARDS")
        UIApplication.shared.openURL(keyboardSettingsURL!)
    }
    
}
