//
//  ViewController.swift
//  Chordial
//
//  Created by Ziv Kaputa on 10/22/16.
//  Copyright © 2016 Ziv Kaputa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    
    // MARK: Properties
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    //Tap to disable keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Character Limit
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        
        let newLength = text.characters.count + string.characters.count - range.length
        NSLog(string)
        NSLog(String(string.characters.count))
        NSLog(String(describing: range.toRange()))
        let correctSize = newLength <= 100 // Bool
        
        
        let disallowedCharacterSet = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-").inverted
        let replacementStringIsLegal = string.rangeOfCharacter(from: disallowedCharacterSet) == nil
        
        return correctSize && replacementStringIsLegal
        
        
    }
    // MARK: Actions
    @IBAction func login(_ sender: UIButton) {
        welcomeLabel.text = "Hello, " + usernameField.text!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Handle the text field’s user input through delegate callbacks.
        usernameField.delegate = self
        passwordField.delegate = self
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

