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
        
        testTextView.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clearText() {
        testTextView.text = ""
    }

}

