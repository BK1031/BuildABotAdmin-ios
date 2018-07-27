//
//  LoginViewController.swift
//  Build A Bot Admin
//
//  Created by Bharat Kathi on 4/4/18.
//  Copyright © 2018 Bharat Kathi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var goButton: UIButton!
    
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        getStartedButton.layer.cornerRadius = 10
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    @IBAction func logInButton(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            //Check if User exists
            if user != nil {
                self.performSegue(withIdentifier: "login", sender: self)
            }
            else {
                let alert = UIAlertController(title: "Login Failed", message: "An error occured while trying to log you in, please try again later.", preferredStyle: .alert)
                let action = UIAlertAction(title: "Got it", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    @IBAction func volunteerRegistratoin(_ sender: Any) {
        ref?.child("volunteerCodes").child(codeTextField.text!).observe(.value, with: { (snapshot) in
            if let codeData = snapshot.value as? Any {
                selectedSession = codeData as! String
                self.performSegue(withIdentifier: "register", sender: self)
            }
        })
    }
    
}
