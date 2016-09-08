//
//  MainViewController.swift
//  MagicSpell
//
//  Created by Lingyi Li on 9/6/16.
//  Copyright © 2016 Georgia Tech. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController {

    var textView : UITextView!
    var btnForClear : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeView()
        textView?.becomeFirstResponder()
        
        let item : UITextInputAssistantItem = textView.inputAssistantItem
        item.leadingBarButtonGroups = []
        item.trailingBarButtonGroups = []
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeView() {
        self.view.backgroundColor = UIColor.whiteColor()
        
        textView = UITextView()
        textView.setWidth(UIScreen.mainScreen().bounds.size.width - 60)
        textView.setHeight(200)
        textView.layer.masksToBounds = true
        textView.layer.cornerRadius = 8
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.Hexcolor(0x333333).CGColor
        textView.setTop(50)
        textView.setLeft(UIScreen.mainScreen().bounds.size.width/2 - (textView.width)/2)
        textView.autoresizingMask = [.FlexibleLeftMargin, .FlexibleRightMargin, .FlexibleBottomMargin, .FlexibleTopMargin, .FlexibleWidth]
        self.view.addSubview(textView)
        
        
        btnForClear = UIButton()
        btnForClear.setTitle("Clear", forState: UIControlState.Normal)
        btnForClear.setTitleColor(UIColor.Hexcolor(0x4C4CFF), forState: UIControlState.Normal)
        btnForClear.titleLabel?.font = UIFont.systemFontOfSize(13)
        btnForClear.sizeToFit()
        btnForClear.setTop(textView.bottom + 10)
        btnForClear.setLeft(textView.left)
        btnForClear.autoresizingMask = [.FlexibleLeftMargin, .FlexibleRightMargin]
        self.view.addSubview(btnForClear)
        btnForClear.addTarget(self, action: #selector(clearText), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func clearText() {
        textView.text = ""
    }
    
    
}
