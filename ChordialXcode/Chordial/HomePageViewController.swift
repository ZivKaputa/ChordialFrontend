//
//  HomePageViewController.swift
//  Chordial
//
//  Created by Ziv Kaputa on 10/24/16.
//  Copyright © 2016 Ziv Kaputa. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var addFriendButton: UIButton!
    @IBOutlet weak var friendUsernameField: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        if textField == friendUsernameField{
            findFriend()
        }
        // textField.resignFirstResponder()
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
        
        //Check size and characters
        let correctSize = newLength <= 100 // Bool
        let disallowedCharacterSet = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-").inverted
        let replacementStringIsLegal = string.rangeOfCharacter(from: disallowedCharacterSet) == nil
        
        return correctSize && replacementStringIsLegal
        
        
    }

     
    
    
    // MARK: Actions
    @IBAction func addFriendClicked(_ sender: AnyObject) {
        findFriend()
    }
    
    func findFriend(){
        //Implement backend call
        let username = friendUsernameField.text
        if username == "admin" {
            NSLog("Found Username")
            goToSharedSongs()
        }
        else{
            displayFindFriendErrorMessage()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Handle the text field’s user input through delegate callbacks.
        friendUsernameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func displayFindFriendErrorMessage(){
        let alertController = UIAlertController(title: "Search Failed", message:
            "\nThis username cannot be not found", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func goToSharedSongs(){
        self.performSegue(withIdentifier: "goShared", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "One"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
