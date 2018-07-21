//
//  SessionsViewController.swift
//  Build A Bot
//
//  Created by Bharat Kathi on 4/12/18.
//  Copyright © 2018 Bharat Kathi. All rights reserved.
//

import UIKit
import Firebase

class SessionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newSessionButton: UIButton!
    
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    
    var sessionList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        
        newSessionButton.layer.cornerRadius = newSessionButton.frame.height / 2
        
        ref = Database.database().reference()
        
        databaseHandle = ref?.child("sessions").observe(.value, with: { (snapshot) in
            if snapshot.childrenCount > 0 {
                self.sessionList.removeAll()
                
                for session in snapshot.children.allObjects as! [DataSnapshot] {
                    let sessionName = session.value as? [String: AnyObject]
                    self.sessionList.append(sessionName!["sessionName"] as! String)
                }
                
                self.tableView.reloadData()
            }
                
            else {
                self.sessionList.removeAll()
                self.tableView.reloadData()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = sessionList[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSession = sessionList[indexPath.row]
        performSegue(withIdentifier: "sessionStuff", sender: self)
    }
    
    @IBAction func newSession(_ sender: UIButton) {
        self.performSegue(withIdentifier: "newSession", sender: self)
    }
    
}
