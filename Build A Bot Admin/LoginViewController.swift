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
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var logInStatusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInStatusLabel.text = ""
        loginButton.layer.cornerRadius = 10
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    @IBAction func logInButton(_ sender: UIButton) {
        self.logInStatusLabel.text = ""
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            //Check if User exists
            if user != nil {
                self.logInStatusLabel.text = "Logging In"
                self.logInStatusLabel.textColor = UIColor.green
                self.performSegue(withIdentifier: "login", sender: self)
            }
            else {
                self.logInStatusLabel.text = "Login Failed"
                self.logInStatusLabel.textColor = UIColor.red
            }
        }
    }

}
