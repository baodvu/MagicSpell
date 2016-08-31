//
//  InstrPageViewController.swift
//  MagicSpell
//
//  Created by Lingyi Li on 8/31/16.
//  Copyright © 2016 Georgia Tech. All rights reserved.
//

import UIKit

class InstrPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableViewForInstruction: UITableView!
    var cellForInstruction : InstrPageTableViewCell!
    var labelForTitle : UILabel!
    var labelForSubtitle : UILabel!
    var btnForAlreadyDone : UIButton!
    
    var instructionSet = ["1.  Open your device settings", "2.  General", "3.  Keyboard", "4.  Keyboards", "5.  Add new keyboard", "6.  MagicSpell keyboard", "7.  Tap MagicSpell", "8.  Allow Full access"]
    var instructionIcon = [UIImage(named:"setting-icon"), UIImage(named:"general-icon")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableViewForInstruction = UITableView(frame: CGRectMake(0, 0, 0, 0))
        tableViewForInstruction.dataSource = self
        tableViewForInstruction.delegate = self
        tableViewForInstruction.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        makeViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeViews() {
        self.view.backgroundColor = Hexcolor(0xD3D9DF)
        
        labelForTitle = UILabel()
        labelForTitle.text = "MagicSpell"
        labelForTitle.font = UIFont.systemFontOfSize(50)
        labelForTitle.sizeToFit()
        labelForTitle.left = UIScreen.mainScreen().bounds.size.width/2 - labelForTitle.width/2
        labelForTitle.top = 50
        self.view.addSubview(labelForTitle)
        
        labelForSubtitle = UILabel()
        labelForSubtitle.text = "To SetUp MagicSpell Keyboard, follow these steps:"
        labelForSubtitle.font = UIFont.systemFontOfSize(13)
        labelForSubtitle.sizeToFit()
        labelForSubtitle.width = UIScreen.mainScreen().bounds.size.width
        labelForSubtitle.textAlignment = NSTextAlignment.Center
        labelForSubtitle.left = 0
        labelForSubtitle.top = labelForTitle.bottom + 50
        self.view.addSubview(labelForSubtitle)
        
        tableViewForInstruction.width = UIScreen.mainScreen().bounds.size.width - 40
        tableViewForInstruction.height = 250
        tableViewForInstruction.left = UIScreen.mainScreen().bounds.size.width/2 - tableViewForInstruction.width/2
        tableViewForInstruction.top = labelForSubtitle.bottom + 50
        tableViewForInstruction.layer.borderColor = UIColor.blackColor().CGColor
        tableViewForInstruction.separatorStyle = UITableViewCellSeparatorStyle.None
        tableViewForInstruction.scrollEnabled = false
        self.view.addSubview(tableViewForInstruction)
        
        btnForAlreadyDone = UIButton()
        btnForAlreadyDone.setTitle("Already Done This?", forState: UIControlState.Normal)
        btnForAlreadyDone.setTitleColor(Hexcolor(0x4C4CFF), forState: UIControlState.Normal)
        btnForAlreadyDone.titleLabel?.font = UIFont.systemFontOfSize(13)
        btnForAlreadyDone.sizeToFit()
        btnForAlreadyDone.left = UIScreen.mainScreen().bounds.size.width/2 - btnForAlreadyDone.width/2
        btnForAlreadyDone.top = UIScreen.mainScreen().bounds.size.height - 50
        self.view.addSubview(btnForAlreadyDone)
        btnForAlreadyDone.addTarget(self, action: #selector(buttonTapped), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func buttonTapped(sender:UIButton!) {
        let myView = (self.storyboard?.instantiateViewControllerWithIdentifier("main"))! as UIViewController
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.window?.rootViewController = myView
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return instructionSet.count;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 30;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : InstrPageTableViewCell = InstrPageTableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        if (indexPath.row < instructionIcon.count) {
            cell.imageViewForIcon.image = instructionIcon[indexPath.row]
        }
        cell.labelForInstruction.text = instructionSet[indexPath.row]
        
        return cell;
    }
}
