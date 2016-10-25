//
//  ViewController.swift
//  Chordial
//
//  Created by Ziv Kaputa on 10/22/16.
//  Copyright © 2016 Ziv Kaputa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    
    // Mark: Properties
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        if textField == passwordField{
            login()
        }
        textField.resignFirstResponder()
        return true
    }
    
    //Tap to disable keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    // MARK: Actions
    @IBAction func loginClicked(_ sender: AnyObject) {
        login()
    }
    
    func login(){
        //Implement backend call
        let username = usernameField.text
        let password = passwordField.text
        if username == "admin" && password == "admin"{
        NSLog("Logged In")
        goToHomePage()
        }
        else{
            displayLoginErrorMessage()
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Handle the text field’s user input through delegate callbacks.
        usernameField.delegate = self
        passwordField.delegate = self
        
    }
    
    func goToHomePage(){
        
        NSLog("Trying to segue")
        self.performSegue(withIdentifier: "goHome", sender: self)
        
    }
    
    func displayLoginErrorMessage(){
        let alertController = UIAlertController(title: "Login Failed", message:
            "\nUsername and/or password not found", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    func validateUsernameText(){
    
    }
    
    func validatePasswordText(){
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

