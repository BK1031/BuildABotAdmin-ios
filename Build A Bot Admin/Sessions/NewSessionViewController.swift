//
//  NewSessionViewController.swift
//  Build A Bot Admin
//
//  Created by Bharat Kathi on 7/21/18.
//  Copyright © 2018 Bharat Kathi. All rights reserved.
//

import UIKit
import Firebase

class NewSessionViewController: UIViewController {

    @IBOutlet weak var sessionNameTextField: UITextField!
    @IBOutlet weak var sessionDescription: UITextView!
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "New Session"
        createButton.layer.cornerRadius = 10
        
        ref = Database.database().reference()
    }

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createSession(_ sender: UIButton) {
        let values = ["sessionName": sessionNameTextField.text, "description": sessionDescription.text, "code": codeTextField.text]
        let sessionRef = self.ref?.child("sessions").child(sessionNameTextField.text!)
        sessionRef?.updateChildValues(values)
        
        let code = [codeTextField.text!: sessionNameTextField.text!]
        let codeRef = self.ref?.child("volunteerCodes")
        codeRef?.updateChildValues(code)
        self.dismiss(animated: true, completion: nil)
    }
    
}
