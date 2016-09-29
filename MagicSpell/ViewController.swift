//
//  ViewController.swift
//  MagicSpell
//
//  Created by Bao Vu on 1/31/16.
//  Copyright © 2016 Georgia Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testTextView.layer.borderColor = UIColor.black.cgColor
        testTextView.layer.borderWidth = 1
        testTextView.layer.cornerRadius = 5
        
        testTextView.becomeFirstResponder()
        
//        if #available(iOS 9.0, *) {
            let item : UITextInputAssistantItem = testTextView.inputAssistantItem
            item.leadingBarButtonGroups = []
            item.trailingBarButtonGroups = []
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clearText() {
        testTextView.text = ""
    }
    
   

}

