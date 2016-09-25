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
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var btnForStart: UIButton!
    var imageArray = [UIImage(named: "switch_01")!, UIImage(named: "switch_02")!, UIImage(named: "switch_03")!, UIImage(named: "switch_04")!];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnForStart.layer.borderColor = UIColor.appleBlue().CGColor
        btnForStart.layer.cornerRadius = 4
        btnForStart.layer.borderWidth = 1

        imageView.animationImages = imageArray
        imageView.animationRepeatCount = 0
        imageView.animationDuration = 6
        imageView.startAnimating()

        textField.becomeFirstResponder()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(isKeyboardSwitched), name: UITextInputCurrentInputModeDidChangeNotification, object: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startTapped(sender: AnyObject) {
        let myView = (self.storyboard?.instantiateViewControllerWithIdentifier("main"))! as UIViewController
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.window?.rootViewController = myView
    }
    
    func dismissKeyboard(gesture: UITapGestureRecognizer) {
        textField.endEditing(true)
    }
    
    
    func isKeyboardSwitched() {
       
        
//        let key = textField.textInputMode?.primaryLanguage
//        print(key.count)
//        if (key == ) {
//            let myView = (self.storyboard?.instantiateViewControllerWithIdentifier("main"))! as UIViewController
//            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//            appDelegate.window?.rootViewController = myView
//
//        }

        
    }
}
