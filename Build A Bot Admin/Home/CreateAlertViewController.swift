
//
//  CreateAlertViewController.swift
//  Build A Bot Admin
//
//  Created by Bharat Kathi on 6/15/18.
//  Copyright © 2018 Bharat Kathi. All rights reserved.
//

import UIKit

class CreateAlertViewController: UIViewController {
    
    @IBOutlet weak var createButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton.layer.cornerRadius = 10
    }

    @IBAction func createAnnouncement(_ sender: UIButton) {
        //Handle announcement creation here
    }
    
    @IBAction func createAnnoncement(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
