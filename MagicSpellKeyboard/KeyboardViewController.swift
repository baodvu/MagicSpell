//
//  KeyboardViewController.swift
//  MagicSpellKeyboard
//
//  Created by Bao Vu on 1/31/16.
//  Copyright © 2016 Georgia Tech. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    @IBOutlet weak var leftPinkyFingerButton: UIButton!
    @IBOutlet weak var leftRingFingerButton: UIButton!
    @IBOutlet weak var leftMiddleFingerButton: UIButton!
    @IBOutlet weak var leftIndexFingerButton: UIButton!
    @IBOutlet weak var leftThumbFingerButton: UIButton!
    
    @IBOutlet weak var rightIndexFingerButton: UIButton!
    @IBOutlet weak var rightMiddleFingerButton: UIButton!
    @IBOutlet weak var rightRingFingerButton: UIButton!
    @IBOutlet weak var rightPinkyFingerButton: UIButton!
    @IBOutlet weak var rightThumbFingerButton: UIButton!
    @IBOutlet weak var visibilitySwitch: UISwitch!
    
    var customInterface: UIView!
    
    var heightConstraint: NSLayoutConstraint!
    
    let keyboardHeight:CGFloat = 400
    var keyPressed = [UIButton]()
    var normalButtonColor = UIColor.init(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.75)
    var pressedButtonColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.75)
    var transparentButtonColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0)
    var keyArray = [UIButton]()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        let nib = UINib(nibName: "CustomKeyboardInterface", bundle: nil)
        let objects = nib.instantiateWithOwner(self, options: nil)
        customInterface = objects[0] as! UIView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
//        setUpHeightConstraint()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up view's dimension
        
        view.addSubview(customInterface)
        
        
        keyArray = [leftPinkyFingerButton, leftRingFingerButton, leftMiddleFingerButton, leftIndexFingerButton, leftThumbFingerButton, rightPinkyFingerButton, rightRingFingerButton, rightMiddleFingerButton, rightIndexFingerButton, rightThumbFingerButton]
        for key in keyArray {
            key.backgroundColor = normalButtonColor
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        setUpHeightConstraint()
        resizeKeyboard()
    }
    
    func addKeyboardButtons() {
        addNextKeyboardButton()
    }
    
    func addNextKeyboardButton() {
        self.nextKeyboardButton = UIButton(type: .System)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor).active = true
        self.nextKeyboardButton.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor).active = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    
//        let textColor: UIColor
//        let proxy = self.textDocumentProxy
//        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
//            textColor = UIColor.whiteColor()
//        } else {
//            textColor = UIColor.blackColor()
//        }
//        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }
    
    func insertTextToDocumentProxy(text: String) {
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText(text)
    }
    // MARK: Key actions
    
    @IBAction func didTapNextKeyboard(sender: UIButton) {
        self.advanceToNextInputMode()
    }
    
    @IBAction func didTapComma() {
        insertTextToDocumentProxy(",")
    }
    
    @IBAction func didTapPeriod() {
        insertTextToDocumentProxy(".")
    }
    
    @IBAction func didTapSpaceBar() {
        insertTextToDocumentProxy(" ")
    }
    
    @IBAction func didTapBackspace() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.deleteBackward()
    }
    
    @IBAction func didTapEnter() {
        insertTextToDocumentProxy("\n")
    }
    
    @IBAction func touchDownFinger(sender: UIButton) {
        if visibilitySwitch.on {
            sender.backgroundColor = pressedButtonColor
        }
        let proxy = textDocumentProxy as UITextDocumentProxy
        if keyPressed.count == 0 {
            switch sender {
            case leftPinkyFingerButton:
                proxy.insertText("a")
            case leftRingFingerButton:
                proxy.insertText("b")
            case leftMiddleFingerButton:
                proxy.insertText("c")
            case leftIndexFingerButton:
                proxy.insertText("d")
            case leftThumbFingerButton:
                proxy.insertText("e")
            case rightPinkyFingerButton:
                proxy.insertText("j")
            case rightRingFingerButton:
                proxy.insertText("i")
            case rightMiddleFingerButton:
                proxy.insertText("h")
            case rightIndexFingerButton:
                proxy.insertText("g")
            case rightThumbFingerButton:
                proxy.insertText("f")
            default:
                break
            }
            keyPressed += [sender]
        } else if keyPressed.count == 1 {
            proxy.deleteBackward()
            keyPressed += [sender]
            if keyEquals(keyPressed, key1: leftPinkyFingerButton, key2: rightPinkyFingerButton) {
                proxy.insertText("k")
            } else if keyEquals(keyPressed, key1: leftRingFingerButton, key2: rightRingFingerButton) {
                proxy.insertText("l")
            } else if keyEquals(keyPressed, key1: leftMiddleFingerButton, key2: rightMiddleFingerButton) {
                proxy.insertText("m")
            } else if keyEquals(keyPressed, key1: leftIndexFingerButton, key2: rightIndexFingerButton) {
                proxy.insertText("n")
            } else if keyEquals(keyPressed, key1: leftThumbFingerButton, key2: rightThumbFingerButton) {
                proxy.insertText("o")
            } else if keyEquals(keyPressed, key1: leftPinkyFingerButton, key2: leftThumbFingerButton) {
                proxy.insertText("p")
            } else if keyEquals(keyPressed, key1: leftRingFingerButton, key2: leftThumbFingerButton) {
                proxy.insertText("q")
            } else if keyEquals(keyPressed, key1: leftMiddleFingerButton, key2: leftThumbFingerButton) {
                proxy.insertText("r")
            } else if keyEquals(keyPressed, key1: leftIndexFingerButton, key2: leftThumbFingerButton) {
                proxy.insertText("s")
            } else if keyEquals(keyPressed, key1: rightIndexFingerButton, key2: rightThumbFingerButton) {
                proxy.insertText("t")
            } else if keyEquals(keyPressed, key1: rightMiddleFingerButton, key2: rightThumbFingerButton) {
                proxy.insertText("u")
            } else if keyEquals(keyPressed, key1: rightRingFingerButton, key2: rightThumbFingerButton) {
                proxy.insertText("v")
            } else if keyEquals(keyPressed, key1: rightPinkyFingerButton, key2: rightThumbFingerButton) {
                proxy.insertText("w")
            } else if keyEquals(keyPressed, key1: leftPinkyFingerButton, key2: leftRingFingerButton) {
                proxy.insertText("x")
            } else if keyEquals(keyPressed, key1: leftMiddleFingerButton, key2: leftIndexFingerButton) {
                proxy.insertText("y")
            } else if keyEquals(keyPressed, key1: rightMiddleFingerButton, key2: rightIndexFingerButton) {
                proxy.insertText("z")
            } else if keyEquals(keyPressed, key1: rightRingFingerButton, key2: rightPinkyFingerButton) {
                proxy.deleteBackward()
            } else {
                keyPressed = []
            }
        } else {
            keyPressed = []
        }
    }
    
    func keyEquals(keyArray: Array<UIButton>, key1: UIButton, key2: UIButton) -> Bool {
        return (keyArray[0] == key1 && keyArray[1] == key2) || (keyArray[1] == key1 && keyArray[0] == key2)
    }
    
    
    @IBAction func touchUpFinger(sender: UIButton) {
        if visibilitySwitch.on {
            sender.backgroundColor = normalButtonColor
        }
//        if let foundIndex = keyPressed.indexOf(sender) {
//            keyPressed.removeAtIndex(foundIndex)
//        }
        
        keyPressed = []
    }
    
    func setUpHeightConstraint() {
        let customHeight: CGFloat = keyboardHeight
        
        if heightConstraint == nil {
            heightConstraint = NSLayoutConstraint(
                item: self.view,
                attribute: .Height,
                relatedBy: .Equal,
                toItem: nil,
                attribute: .NotAnAttribute,
                multiplier: 0.0,
                constant: customHeight
            )
            heightConstraint.priority = UILayoutPriority(999)
            
            view.addConstraint(heightConstraint)
        } else {
            heightConstraint.constant = customHeight
        }
    }
    
    func resizeKeyboard() {
        let multiplier: CGFloat = 1.0
        let leftKeyArray = [leftPinkyFingerButton, leftRingFingerButton, leftMiddleFingerButton, leftIndexFingerButton, leftThumbFingerButton]
        let rightKeyArray = [rightPinkyFingerButton, rightRingFingerButton, rightMiddleFingerButton, rightIndexFingerButton, rightThumbFingerButton]
        let midPoint = (rightThumbFingerButton.frame.origin.x + (leftThumbFingerButton.frame.origin.x + leftThumbFingerButton.frame.size.width))/2
        let deltaX = midPoint*(1 - multiplier)
        
        for key in leftKeyArray + rightKeyArray{
            key.frame.size.height *= multiplier
            key.frame.size.width *= multiplier
            key.frame.origin.x *= multiplier
            key.frame.origin.x += deltaX
            key.frame.origin.y *= multiplier
        }
    }
    
    @IBAction func toggleVisibility(sender: UISwitch) {
        if sender.on {
            for key in keyArray {
                key.backgroundColor = normalButtonColor
            }
        } else {
            for key in keyArray {
                key.backgroundColor = transparentButtonColor
            }
        }
    }

}
