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
    var labelForTitle : UILabel!
    var imageViewForInstruction : UIImageView!
    var textFieldForInput : UITextField!
    var btnForStart : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        makeViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeViews() {
        self.view.backgroundColor = UIColor.whiteColor()
        
        labelForTitle = UILabel()
        labelForTitle.text = "Hold  To Switch to MagicSpell Keyboard"
        labelForTitle.textColor = UIColor.Hexcolor(0x4A4A4A)
        labelForTitle.font = UIFont.systemFontOfSize(28)
        labelForTitle.sizeToFit()
        labelForTitle.setLeft(UIScreen.mainScreen().bounds.size.width/2 - labelForTitle.width/2)
        labelForTitle.setTop(50)
        labelForTitle.autoresizingMask = [.FlexibleLeftMargin, .FlexibleRightMargin, .FlexibleBottomMargin, .FlexibleTopMargin]
        self.view.addSubview(labelForTitle)
        
        imageViewForInstruction = UIImageView()
        imageViewForInstruction.image = UIImage(named: "switchKeyboard")
        imageViewForInstruction.setWidth(300)
        imageViewForInstruction.setHeight(250)
        imageViewForInstruction.setTop(labelForTitle.bottom + 30)
        imageViewForInstruction.setLeft(UIScreen.mainScreen().bounds.size.width/2 - imageViewForInstruction.width/2)
        imageViewForInstruction.autoresizingMask = [.FlexibleLeftMargin, .FlexibleRightMargin, .FlexibleBottomMargin, .FlexibleTopMargin]
        self.view.addSubview(imageViewForInstruction)
        
        btnForStart = UIButton()
        btnForStart.setTitle("Let's Start", forState: UIControlState.Normal)
        btnForStart.setTitleColor(UIColor.Hexcolor(0xE14210), forState: UIControlState.Normal)
        btnForStart.titleLabel?.font = UIFont.systemFontOfSize(20)
        btnForStart.layer.masksToBounds = true
        btnForStart.layer.cornerRadius = 8
        btnForStart.layer.borderColor = UIColor.Hexcolor(0xE14210).CGColor
        btnForStart.layer.borderWidth = 2
        btnForStart.setWidth(150)
        btnForStart.setHeight(40)
        btnForStart.setLeft(UIScreen.mainScreen().bounds.size.width/2 - btnForStart.width/2)
        btnForStart.setTop(UIScreen.mainScreen().bounds.size.height - 150)
        btnForStart.autoresizingMask = [.FlexibleLeftMargin, .FlexibleRightMargin, .FlexibleTopMargin]
        self.view.addSubview(btnForStart)
        btnForStart.addTarget(self, action: #selector(buttonTapped), forControlEvents: UIControlEvents.TouchUpInside)
        
        textFieldForInput = UITextField()
        textFieldForInput.hidden = true;
        self.view.addSubview(textFieldForInput)
        
        textFieldForInput.becomeFirstResponder()
    }
    
    func buttonTapped(sender: UIButton!) {
        let viewController : MainViewController
        viewController = MainViewController()
        self.presentViewController(viewController, animated: false, completion: nil)
    }
    
    func dismissKeyboard(gesture: UITapGestureRecognizer) {
        textFieldForInput.resignFirstResponder()
    }
}
