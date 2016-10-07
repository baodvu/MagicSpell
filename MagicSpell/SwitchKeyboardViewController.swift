//
//  SwitchKeyboardViewController.swift
//  MagicSpell
//
//  Created by Lingyi Li on 9/6/16.
//  Copyright © 2016 Georgia Tech. All rights reserved.
//

import Foundation
import UIKit

class SwitchKeyboardViewController: UIViewController {
    
    static let nextScreenIdentifier = "mainView"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    var imageArray = [UIImage(named: "switch_01")!, UIImage(named: "switch_02")!, UIImage(named: "switch_03")!, UIImage(named: "switch_04")!];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.animationImages = imageArray
        imageView.animationRepeatCount = 0
        imageView.animationDuration = 6
        imageView.startAnimating()

        textField.becomeFirstResponder()

        let item : UITextInputAssistantItem = textField.inputAssistantItem
        item.leadingBarButtonGroups = []
        item.trailingBarButtonGroups = []

        registerKeyboardSwitchingObserver()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardSwitched(_ name : String) {
        // Please leave this print statement for debugging purposes
        print("received notification: \(name)")
        
        let myView = (self.storyboard?.instantiateViewController(withIdentifier: SwitchKeyboardViewController.nextScreenIdentifier))! as UIViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = myView
    }
    
    func registerKeyboardSwitchingObserver() {
        // Void pointer to `self`
        let observer = UnsafeMutableRawPointer(Unmanaged.passRetained(self).toOpaque())
        
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                        observer,
                                        { (_, observer, name, _, _) -> Void in
                                            if let observer = observer, let name = name {
                                                
                                                // Extract pointer to `self` from void pointer
                                                let mySelf = Unmanaged<SwitchKeyboardViewController>.fromOpaque(observer).takeUnretainedValue()
                                                // Call instance method
                                                mySelf.keyboardSwitched(name.rawValue as String)
                                            }
            },
                                        "cc.gatech.edu.pentagon.magicspell.switched" as CFString,
                                        nil,
                                        .deliverImmediately)
    }
}
