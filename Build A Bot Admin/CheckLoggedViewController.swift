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
            let user = Auth.auth().currentUser
            if let user = user {
                userID = user.uid
                email = user.email!
                Database.database().reference().child("users").child(userID).observe(.value) { (snapshot) in
                    if let userData = snapshot.value as? [String: Any] {
                        name = userData["name"] as! String
                        access = userData["access"] as! String
                    }
                }
            }
            performSegue(withIdentifier: "userLogged", sender: self)
        } else {
            performSegue(withIdentifier: "needLog", sender: self)
        }
    }

}
