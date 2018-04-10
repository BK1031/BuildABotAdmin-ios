//
//  NewMatchViewController.swift
//  Build A Bot Admin
//
//  Created by Bharat Kathi on 4/4/18.
//  Copyright © 2018 Bharat Kathi. All rights reserved.
//

import UIKit
import Firebase

class NewMatchViewController: UIViewController {
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    
    var seconds = 300
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        self.navigationItem.title = "Curent Match \(currentMatch): \(currentTeam)"
        self.navigationItem.hidesBackButton = true
        cancelButton.layer.cornerRadius = cancelButton.frame.height / 2
        doneButton.layer.cornerRadius = doneButton.frame.height / 2
        doneButton.setTitle("End", for: .normal)
        
        ref = Database.database().reference()
        let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
        let values = ["ambulance": "", "blackBox": false, "buildingBlocks": 0, "chimney": false, "fieldDamage": 0, "flag": false, "greenBike": false, "loops": 0, "matchNumber": currentMatch, "matchPoints": 0, "powerPenalty": false, "stairs": false, "stove": false, "teamName": currentTeam, "timeLeft": "0:00", "tirePenalty": 0] as [String : Any]
        matchReference?.updateChildValues(values)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
    }
    
    @objc func counter() {
        seconds -= 1
        let minutesLeft = Int(seconds) / 60 % 60
        let secondsLeft = Int(seconds) % 60
        
        timerLabel.text = "Match Time: \(minutesLeft):\(secondsLeft)"
        
        if (seconds == 0) {
            timer.invalidate()
            doneButton.setTitle("Done", for: .normal)
        }
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
        let values = ["ambulance": nil, "blackBox": nil, "buildingBlocks": nil, "chimney": nil, "fieldDamage": nil, "flag": nil, "greenBike": nil, "loops": nil, "matchNumber": nil, "matchPoints": nil, "powerPenalty": nil, "stairs": nil, "stove": nil, "teamName": nil, "timeLeft": nil, "tirePenalty": nil] as [String : Any?]
        matchReference?.updateChildValues(values)
        
        currentTeam = ""
        currentMatch = ""
        selectedCurrent = false
        
        ambulance = ""
        blackBox = false
        buildingBlocks = 0
        chimney = false
        fieldDamage = 0
        flag = false
        bike = false
        loops = 0
        points = 0
        powerPenalty = false
        stairs = false
        stove = false
        tirePenalty = 0
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
        let values = ["ambulance": nil, "blackBox": nil, "buildingBlocks": nil, "chimney": nil, "fieldDamage": nil, "flag": nil, "greenBike": nil, "loops": nil, "matchNumber": nil, "matchPoints": nil, "powerPenalty": nil, "stairs": nil, "stove": nil, "teamName": nil, "timeLeft": nil, "tirePenalty": nil] as [String : Any?]
        matchReference?.updateChildValues(values)
        
        let pastMatchRef = self.ref?.child("gameDay").child(selectedSession).child("matches").child(currentMatch)
        let matchData = ["ambulance": ambulance, "blackBox": blackBox, "buildingBlocks": buildingBlocks, "chimney": chimney, "fieldDamage": fieldDamage, "flag": flag, "greenBike": bike, "loops": loops, "matchNumber": currentMatch, "matchPoints": String(points), "powerPenalty": powerPenalty, "stairs": stairs, "stove": stove, "teamName": currentTeam, "timeLeft": "0:00", "tirePenalty": tirePenalty] as [String : Any?]
        pastMatchRef?.updateChildValues(matchData)
        
        currentTeam = ""
        currentMatch = ""
        selectedCurrent = false
        
        ambulance = ""
        blackBox = false
        buildingBlocks = 0
        chimney = false
        fieldDamage = 0
        flag = false
        bike = false
        loops = 0
        points = 0
        powerPenalty = false
        stairs = false
        stove = false
        tirePenalty = 0
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
