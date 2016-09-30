import UIKit

class KeyboardViewController: UIInputViewController {
    
    // MARK: UI Components
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
    
    var heightConstraint: NSLayoutConstraint!
    var keyboardHeight:CGFloat = 400
    var buttonToFinger = [UIButton: Finger]()
    
    // MARK: Keyboard states
    var shiftKeyActive = false {
        didSet {
            shiftButton.setImage(UIImage(named: shiftKeyActive ? "Shift - filled" : "Shift"), for: UIControlState())
        }
    }
    var fingersPressed = Set<Finger>()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        let nib = UINib(nibName: "CustomKeyboardInterface", bundle: nil)
        let objects = nib.instantiate(withOwner: self, options: nil)
        customInterface = objects[0] as! UIView
        customInterface.frame = view.frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendKeyboardNotification()
        
        view.addSubview(customInterface)

        buttonToFinger[leftPinkyFingerButton!] = Finger(side: .left, name: .pinky)
        buttonToFinger[leftRingFingerButton!] = Finger(side: .left, name: .ring)
        buttonToFinger[leftMiddleFingerButton!] = Finger(side: .left, name: .middle)
        buttonToFinger[leftIndexFingerButton!] = Finger(side: .left, name: .index)
        buttonToFinger[leftThumbFingerButton!] = Finger(side: .left, name: .thumb)
        
        buttonToFinger[rightPinkyFingerButton!] = Finger(side: .right, name: .pinky)
        buttonToFinger[rightRingFingerButton!] = Finger(side: .right, name: .ring)
        buttonToFinger[rightMiddleFingerButton!] = Finger(side: .right, name: .middle)
        buttonToFinger[rightIndexFingerButton!] = Finger(side: .right, name: .index)
        buttonToFinger[rightThumbFingerButton!] = Finger(side: .right, name: .thumb)
        
        updateKeyLabels()

        // Set up Settings Slide-in
        settingsOverlay.isHidden = true
        keyboardSizeStepper.maximumValue = 4
        keyboardSizeStepper.value = 2
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setUpHeightConstraint()
    }
    
    func sendKeyboardNotification() {
        CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(),
                                             CFNotificationName.init("cc.gatech.edu.pentagon.magicspell.switched" as CFString),
                                             nil, nil, true)
    }
    
    func setUpHeightConstraint() {
        let customHeight: CGFloat = keyboardHeight
        
        if heightConstraint == nil {
            heightConstraint = NSLayoutConstraint(
                item: self.view,
                attribute: .height,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
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
            key.setTitle(LetterMapping.getLetter(potentialFingerCombination, isUpperCase: shiftKeyActive), for: UIControlState())
        }
    }
    
    func toggleShift() {
        shiftButton.setImage(UIImage(named: shiftKeyActive ? "Shift" : "Shift - filled"), for: UIControlState())
        shiftKeyActive = !shiftKeyActive
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
    
    @IBAction func didTapShift(_ sender: UIButton) {
        shiftKeyActive = !shiftKeyActive
        updateKeyLabels()
    }
    
    
    @IBAction func touchDownFinger(_ sender: UIButton) {
        let finger = buttonToFinger[sender]!
        fingersPressed.insert(finger)
        
        // Update text field
        if let letter = LetterMapping.getLetter(fingersPressed, isUpperCase: shiftKeyActive) {
            if fingersPressed.count == 2 {
                proxy.deleteBackward()
                fingersPressed.removeAll()
            }
            proxy.insertText(letter)
        } else {
            // Invalid combination of keys, clear the stack
            fingersPressed.removeAll()
        }
        updateKeyLabels()
    }
    
    @IBAction func touchUpFinger(_ sender: UIButton) {
        fingersPressed.removeAll()
        shiftKeyActive = false
        updateKeyLabels()
    }
    
    @IBAction func openSettings() {
        settingsSlideIn.center.x += self.settingsSlideIn.frame.width
        settingsOverlay.backgroundColor = settingsOverlay.backgroundColor?.withAlphaComponent(0)
        settingsOverlay.isHidden = false
        UIView.animate(withDuration: 0.4, animations: {
            self.settingsSlideIn.center.x -= self.settingsSlideIn.frame.width
            self.settingsOverlay.backgroundColor = self.settingsOverlay.backgroundColor?.withAlphaComponent(0.25)
        }) 
    }
    
    @IBAction func closeSettings() {
        UIView.animate(withDuration: 0.4, animations: {
            self.settingsSlideIn.center.x += self.settingsSlideIn.frame.width
            self.settingsOverlay.backgroundColor = self.settingsOverlay.backgroundColor?.withAlphaComponent(0)
            }, completion: {(_) -> Void in
                self.settingsOverlay.isHidden = true
                self.settingsSlideIn.center.x -= self.settingsSlideIn.frame.width}) 
    }

    @IBAction func changeSize() {
        keyboardHeight = CGFloat(320 + keyboardSizeStepper.value * 30)
        setUpHeightConstraint()
    }
}
