
//
//  CreateAlertViewController.swift
//  Build A Bot Admin
//
//  Created by Bharat Kathi on 6/15/18.
//  Copyright © 2018 Bharat Kathi. All rights reserved.
//

import UIKit
import Firebase

class CreateAlertViewController: UIViewController {
    
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var announcementTitleTextField: UITextField!
    @IBOutlet weak var announcementDetailText: UITextView!
    @IBOutlet weak var announcementSesionButton: UIButton!
    
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        self.navigationItem.title = "New Announcement"
        createButton.layer.cornerRadius = 10
    }
    
    override func viewDidAppear(_ animated: Bool) {
        announcementSesionButton.setTitle(selectedSession, for: .normal)
        if selectedSession.contains("2") == false {
            announcementSesionButton.setTitle("Click to Select a Session", for: .normal)
        }
    }

    @IBAction func createAnnouncement(_ sender: UIButton) {
        if announcementTitleTextField.text == "" {
            let alert = UIAlertController(title: "Empty Title", message: "Please enter a title for your announcement.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Got it", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        
        else if selectedSession == "blank" {
            let alert = UIAlertController(title: "Select a Session", message: "You must select a session to post your announcement to.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Got it", style: .default) { (completion) in
                self.performSegue(withIdentifier: "filterSession", sender: nil)
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        
        else if announcementDetailText.text == "Click to Edit Announcement Detail" {
            let alert = UIAlertController(title: "Empty Announcement Body", message: "Please enter the details for your announcement.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Got it", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        
        else {
            let announcementReference = self.ref?.child("announcements").child(selectedSession).childByAutoId()
            let announcement = ["details": announcementDetailText.text, "title": announcementTitleTextField.text, "id": announcementReference?.key] as [String: AnyObject]
            announcementReference?.updateChildValues(announcement)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func announcementSession(_ sender: UIButton) {
        self.performSegue(withIdentifier: "filterSession", sender: self)
    }
}
