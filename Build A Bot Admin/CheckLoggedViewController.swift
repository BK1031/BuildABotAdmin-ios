//
//  CheckLoggedViewController.swift
//  Build A Bot Admin
//
//  Created by Bharat Kathi on 4/4/18.
//  Copyright © 2018 Bharat Kathi. All rights reserved.
//

import UIKit
import Firebase

class CheckLoggedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            performSegue(withIdentifier: "userLogged", sender: self)
        } else {
            performSegue(withIdentifier: "needLog", sender: self)
        }
    }

}
