import UIKit

class KeyboardViewController: UIInputViewController {
    
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
    
    
    @IBOutlet weak var shiftButton: UIButton!
    
    @IBOutlet weak var keyboardSizeStepper: UIStepper!
    @IBOutlet weak var settingsOverlay: UIView!
    @IBOutlet weak var settingsSlideIn: UIView!
    
    var customInterface: UIView!
    var proxy: UITextDocumentProxy {
        get { return textDocumentProxy as UITextDocumentProxy }
    }
    
    var buttonToFinger = [UIButton: Finger]()
    
    var heightConstraint: NSLayoutConstraint!
    var keyboardHeight:CGFloat = 400
    
    var shiftKeyActive = false
    
    let normalButtonColor = UIColor.init(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.75)
    let pressedButtonColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.75)
    let transparentButtonColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0)
    
    var fingersPressed = Set<Finger>()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        let nib = UINib(nibName: "CustomKeyboardInterface", bundle: nil)
        let objects = nib.instantiateWithOwner(self, options: nil)
        customInterface = objects[0] as! UIView
        customInterface.frame = view.frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(customInterface)

        buttonToFinger[leftPinkyFingerButton!] = Finger(side: .Left, name: .Pinky)
        buttonToFinger[leftRingFingerButton!] = Finger(side: .Left, name: .Ring)
        buttonToFinger[leftMiddleFingerButton!] = Finger(side: .Left, name: .Middle)
        buttonToFinger[leftIndexFingerButton!] = Finger(side: .Left, name: .Index)
        buttonToFinger[leftThumbFingerButton!] = Finger(side: .Left, name: .Thumb)
        
        buttonToFinger[rightPinkyFingerButton!] = Finger(side: .Right, name: .Pinky)
        buttonToFinger[rightRingFingerButton!] = Finger(side: .Right, name: .Ring)
        buttonToFinger[rightMiddleFingerButton!] = Finger(side: .Right, name: .Middle)
        buttonToFinger[rightIndexFingerButton!] = Finger(side: .Right, name: .Index)
        buttonToFinger[rightThumbFingerButton!] = Finger(side: .Right, name: .Thumb)
        
        for key in buttonToFinger.keys {
            key.backgroundColor = normalButtonColor
        }
        
        updateKeyLabels()
        
        // Set up Settings Slide-in
        keyboardSizeStepper.maximumValue = 4
        keyboardSizeStepper.value = 2
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        setUpHeightConstraint()
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
    
    func updateKeyLabels() {
        for key in buttonToFinger.keys {
            let finger = buttonToFinger[key]
            var potentialFingerCombination = fingersPressed
            potentialFingerCombination.insert(finger!)
            if shiftKeyActive {
                key.setTitle(LetterMapping.getUpperLetter(potentialFingerCombination), forState: .Normal)
            } else {
                key.setTitle(LetterMapping.getLowerLetter(potentialFingerCombination), forState: .Normal)
            }
        }
    }
    
    // MARK: Key actions
    
    @IBAction func didTapNextKeyboard() {
        self.advanceToNextInputMode()
    }
    
    @IBAction func didTapComma() {
        proxy.insertText(",")
    }
    
    @IBAction func didTapPeriod() {
        proxy.insertText(".")
    }
    
    @IBAction func didTapSpaceBar() {
        proxy.insertText(" ")
    }
    
    @IBAction func didTapBackspace() {
        proxy.deleteBackward()
    }
    
    @IBAction func didTapEnter() {
        proxy.insertText("\n")
    }
    
    @IBAction func didTapShift(sender: UIButton) {
        if !shiftKeyActive {
            sender.setTitle("SHIFT ⇧", forState: .Normal)
            shiftKeyActive = true
        } else {
            sender.setTitle("shift ⇧", forState: .Normal)
            shiftKeyActive = false
        }
        updateKeyLabels()
    }
    
    
    @IBAction func touchDownFinger(sender: UIButton) {
        let finger = buttonToFinger[sender]!
        fingersPressed.insert(finger)

        switch fingersPressed.count {
        case 1:
            if shiftKeyActive {
                if let letter = LetterMapping.getUpperLetter(fingersPressed) {
                    proxy.insertText(letter)
                }
            } else {
                if let letter = LetterMapping.getLowerLetter(fingersPressed) {
                    proxy.insertText(letter)
                }
            }
        case 2:
            if shiftKeyActive {
                if let letter = LetterMapping.getUpperLetter(fingersPressed) {
                    proxy.deleteBackward()
                    proxy.insertText(letter)
                } else {
                    fingersPressed.removeAll()
                }
            } else {
                if let letter = LetterMapping.getLowerLetter(fingersPressed) {
                    proxy.deleteBackward()
                    proxy.insertText(letter)
                } else {
                    fingersPressed.removeAll()
                }

            }
        default: fingersPressed.removeAll()

        }
        updateKeyLabels()
    }
    
    @IBAction func touchUpFinger(sender: UIButton) {
        fingersPressed.removeAll()
        shiftButton.setTitle("shift ⇧", forState: .Normal)
        shiftKeyActive = false
        updateKeyLabels()
    }
    
    @IBAction func openSettings() {
        settingsSlideIn.center.x += self.settingsSlideIn.frame.width
        settingsOverlay.backgroundColor = settingsOverlay.backgroundColor?.colorWithAlphaComponent(0)
        settingsOverlay.hidden = false
        UIView.animateWithDuration(0.4) {
            self.settingsSlideIn.center.x -= self.settingsSlideIn.frame.width
            self.settingsOverlay.backgroundColor = self.settingsOverlay.backgroundColor?.colorWithAlphaComponent(0.25)
        }
    }
    
    @IBAction func closeSettings() {
        UIView.animateWithDuration(0.4, animations: {
            self.settingsSlideIn.center.x += self.settingsSlideIn.frame.width
            self.settingsOverlay.backgroundColor = self.settingsOverlay.backgroundColor?.colorWithAlphaComponent(0)
            }) {(_) -> Void in
                self.settingsOverlay.hidden = true
                self.settingsSlideIn.center.x -= self.settingsSlideIn.frame.width}
    }

    @IBAction func changeSize() {
        keyboardHeight = CGFloat(320 + keyboardSizeStepper.value * 30)
        setUpHeightConstraint()
    }
}
