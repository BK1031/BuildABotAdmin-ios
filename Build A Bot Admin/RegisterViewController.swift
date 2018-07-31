//
//  RegisterViewController.swift
//  Build A Bot Admin
//
//  Created by Bharat Kathi on 7/26/18.
//  Copyright © 2018 Bharat Kathi. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.layer.cornerRadius = 10
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }

    @IBAction func register(_ sender: Any) {
        if passwordTextField.text! != confirmTextField.text! {
            let alert = UIAlertController(title: "Passwords Do Not Match", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "Got it", style: .default, handler: nil)
            alert.addAction(action)
        }
        else {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                if user != nil {
                    let user = Auth.auth().currentUser
                    if let user = user {
                        userID = user.uid
                        email = user.email!
                    }
                    let values = ["name": self.nameTextField.text!, "email": email, "access": "mod"] as [String: Any]
                    let userRef = Database.database().reference().child("users").child(userID)
                    userRef.updateChildValues(values)
                }
            }
            performSegue(withIdentifier: "lesgo", sender: self)
        }
    }
    
}
