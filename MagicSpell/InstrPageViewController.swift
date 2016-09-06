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
    
    var labelForTitle : UILabel!
    var labelForSubtitle : UILabel!
    var btnForAlreadyDone : UIButton!
    var imageViewForLeft : UIImageView!
    var imageViewForRight : UIImageView!
    var btnForOpenSetting : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeViews() {
        
        labelForTitle = UILabel()
        labelForTitle.text = "Adding MagicSpell Keyboard"
        labelForTitle.font = UIFont.systemFontOfSize(28)
        labelForTitle.textColor = UIColor.Hexcolor(0x4A4A4A)
        labelForTitle.sizeToFit()
        labelForTitle.setLeft(UIScreen.mainScreen().bounds.size.width/2 - labelForTitle.width/2)
        labelForTitle.setTop(50)
        labelForTitle.autoresizingMask = [.FlexibleLeftMargin, .FlexibleRightMargin, .FlexibleBottomMargin, .FlexibleTopMargin]
        self.view.addSubview(labelForTitle)
        
        labelForSubtitle = UILabel()
        labelForSubtitle.text = "Click the button blow, open the Settings → Add New Keyboard...\n→ Select \"MagicSpell\""
        labelForSubtitle.textColor = UIColor.Hexcolor(0x4A4A4A)
        labelForSubtitle.lineBreakMode = NSLineBreakMode.ByWordWrapping
        labelForSubtitle.numberOfLines = 0
        labelForSubtitle.font = UIFont.systemFontOfSize(20)
        labelForSubtitle.setWidth(642)
        labelForSubtitle.setHeight(68)
        labelForSubtitle.textAlignment = NSTextAlignment.Center
        labelForSubtitle.setLeft(UIScreen.mainScreen().bounds.size.width/2 - labelForSubtitle.width/2)
        labelForSubtitle.setTop(labelForTitle.bottom + 50)
        labelForSubtitle.autoresizingMask = [.FlexibleLeftMargin, .FlexibleRightMargin]
        self.view.addSubview(labelForSubtitle)
        
        imageViewForLeft = UIImageView()
        imageViewForLeft.image = UIImage(named: "instLeft")
        imageViewForLeft.setWidth(230)
        imageViewForLeft.setHeight(200)
        imageViewForLeft.setRight(UIScreen.mainScreen().bounds.size.width/2 - 40)
        imageViewForLeft.setTop(labelForSubtitle.bottom + 100)
        self.view.addSubview(imageViewForLeft)
        
        imageViewForRight = UIImageView()
        imageViewForRight.image = UIImage(named: "instRight")
        imageViewForRight.setWidth(270)
        imageViewForRight.setHeight(120)
        imageViewForRight.setLeft(UIScreen.mainScreen().bounds.size.width/2 + 40)
        imageViewForRight.setTop(imageViewForLeft.height/2+imageViewForLeft.top - imageViewForRight.height/2)
        self.view.addSubview(imageViewForRight)
        
        btnForOpenSetting = UIButton()
        btnForOpenSetting.setTitle("Open Keyboard Setting", forState: UIControlState.Normal)
        btnForOpenSetting.setTitleColor(UIColor.Hexcolor(0xE14210), forState: UIControlState.Normal)
        btnForOpenSetting.titleLabel?.font = UIFont.systemFontOfSize(20)
        btnForOpenSetting.layer.masksToBounds = true
        btnForOpenSetting.layer.cornerRadius = 8
        btnForOpenSetting.layer.borderColor = UIColor.Hexcolor(0xE14210).CGColor
        btnForOpenSetting.layer.borderWidth = 2
        btnForOpenSetting.setWidth(250)
        btnForOpenSetting.setHeight(50)
        btnForOpenSetting.setLeft(UIScreen.mainScreen().bounds.size.width/2 - btnForOpenSetting.width/2)
        btnForOpenSetting.setTop(UIScreen.mainScreen().bounds.size.height - 150)
        btnForOpenSetting.autoresizingMask = [.FlexibleLeftMargin, .FlexibleRightMargin, .FlexibleTopMargin]
        self.view.addSubview(btnForOpenSetting)
        btnForOpenSetting.addTarget(self, action: #selector(buttonForSetting), forControlEvents: UIControlEvents.TouchUpInside)
        
        btnForAlreadyDone = UIButton()
        btnForAlreadyDone.setTitle("Already Done This?", forState: UIControlState.Normal)
        btnForAlreadyDone.setTitleColor(UIColor.Hexcolor(0x4C4CFF), forState: UIControlState.Normal)
        btnForAlreadyDone.setTitleColor(UIColor.Hexcolor(0xE2FCFF), forState: UIControlState.Highlighted)
        btnForAlreadyDone.titleLabel?.font = UIFont.systemFontOfSize(20)
        btnForAlreadyDone.sizeToFit()
        btnForAlreadyDone.setLeft(UIScreen.mainScreen().bounds.size.width/2 - btnForAlreadyDone.width/2)
        btnForAlreadyDone.setTop(UIScreen.mainScreen().bounds.size.height - 50)
        btnForAlreadyDone.autoresizingMask = [.FlexibleLeftMargin, .FlexibleRightMargin, .FlexibleTopMargin]
        self.view.addSubview(btnForAlreadyDone)
        btnForAlreadyDone.addTarget(self, action: #selector(buttonTapped), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func buttonTapped(sender:UIButton!) {
        let viewController : SwitchKeyboardViewController
        viewController = SwitchKeyboardViewController()
        self.presentViewController(viewController, animated: false, completion: nil)
    }
    
    func buttonForSetting(sender: UIButton!) {
        let keyboardSettingsURL = NSURL(string: "prefs:root=General&path=Keyboard/KEYBOARDS")
        UIApplication.sharedApplication().openURL(keyboardSettingsURL!)
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        <#code#>
    }

}
