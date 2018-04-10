//
//  EditMatchViewController.swift
//  Build A Bot Admin
//
//  Created by Bharat Kathi on 4/8/18.
//  Copyright © 2018 Bharat Kathi. All rights reserved.
//

import UIKit
import Firebase

class EditMatchViewController: UITableViewController {
    
    @IBOutlet weak var currentTeamLabel: UILabel!
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    @IBOutlet weak var loopsLabel: UILabel!
    
    @IBOutlet weak var loopsCounter: UIStepper!
    
    @IBOutlet weak var stoveSegmented: UISegmentedControl!
    
    @IBOutlet weak var flagSegmented: UISegmentedControl!
    
    @IBOutlet weak var buildingBlocksLabel: UILabel!
    
    @IBOutlet weak var buildingBlocksCounter: UIStepper!
    
    @IBOutlet weak var blackBoxSegmented: UISegmentedControl!
    
    @IBOutlet weak var bikeSegmented: UISegmentedControl!
    
    @IBOutlet weak var ambulanceSegmented: UISegmentedControl!
    
    @IBOutlet weak var chimneySegmented: UISegmentedControl!
    
    @IBOutlet weak var stairsSegmented: UISegmentedControl!
    
    @IBOutlet weak var tireLabel: UILabel!
    
    @IBOutlet weak var tireCounter: UIStepper!
    
    @IBOutlet weak var powerLineSegmented: UISegmentedControl!
    
    @IBOutlet weak var fieldDamageLabel: UILabel!
    
    @IBOutlet weak var fieldDamageCounter: UIStepper!
    
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        currentTeamLabel.text = currentTeam
        pointsLabel.text = String(points)
        
        loopsCounter.autorepeat = false
    }
    
    @IBAction func loopsValue(_ sender: UIStepper) {
        points -= (loops * 5)
        loops = Int(sender.value)
        points += (loops * 5)
        loopsLabel.text = String(loops)
        pointsLabel.text = String(points)
        
        let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
        let values = ["loops": loops, "matchPoints": String(points)] as [String : Any]
        matchReference?.updateChildValues(values)
    }
    
    @IBAction func stoveSegment(_ sender: UISegmentedControl) {
        switch stoveSegmented.selectedSegmentIndex {
        case 0:
            stove = false
            points -= 15
            pointsLabel.text = String(points)
            let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
            let values = ["stove": stove, "matchPoints": String(points)] as [String : Any]
            matchReference?.updateChildValues(values)
        case 1:
            stove = true
            points += 15
            pointsLabel.text = String(points)
            let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
            let values = ["stove": stove, "matchPoints": String(points)] as [String : Any]
            matchReference?.updateChildValues(values)
        default:
            break
        }
    }
    
    @IBAction func flagSegment(_ sender: UISegmentedControl) {
        switch flagSegmented.selectedSegmentIndex {
        case 0:
            flag = false
            points -= 10
            pointsLabel.text = String(points)
            let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
            let values = ["flag": flag, "matchPoints": String(points)] as [String : Any]
            matchReference?.updateChildValues(values)
        case 1:
            flag = true
            points += 10
            pointsLabel.text = String(points)
            let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
            let values = ["flag": flag, "matchPoints": String(points)] as [String : Any]
            matchReference?.updateChildValues(values)
        default:
            break
        }
    }
    
    @IBAction func buildingBlocksStepper(_ sender: UIStepper) {
        points -= (buildingBlocks * 10)
        buildingBlocks = Int(sender.value)
        points += (buildingBlocks * 10)
        buildingBlocksLabel.text = String(buildingBlocks)
        pointsLabel.text = String(points)
        
        let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
        let values = ["buildingBlocks": buildingBlocks, "matchPoints": String(points)] as [String : Any]
        matchReference?.updateChildValues(values)
    }
    
    @IBAction func blackBoxSegment(_ sender: UISegmentedControl) {
        switch blackBoxSegmented.selectedSegmentIndex {
        case 0:
            blackBox = false
            points -= 20
            pointsLabel.text = String(points)
            let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
            let values = ["blackBox": blackBox, "matchPoints": String(points)] as [String : Any]
            matchReference?.updateChildValues(values)
        case 1:
            blackBox = true
            points += 20
            pointsLabel.text = String(points)
            let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
            let values = ["blackBox": blackBox, "matchPoints": String(points)] as [String : Any]
            matchReference?.updateChildValues(values)
        default:
            break
        }
    }

    @IBAction func bikeSegment(_ sender: UISegmentedControl) {
        switch bikeSegmented.selectedSegmentIndex {
        case 0:
            bike = false
            points -= 15
            pointsLabel.text = String(points)
            let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
            let values = ["greenBike": bike, "matchPoints": String(points)] as [String : Any]
            matchReference?.updateChildValues(values)
        case 1:
            bike = true
            points += 15
            pointsLabel.text = String(points)
            let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
            let values = ["greenBike": bike, "matchPoints": String(points)] as [String : Any]
            matchReference?.updateChildValues(values)
        default:
            break
        }
    }
    
    @IBAction func ambulanceSegment(_ sender: UISegmentedControl) {
        switch ambulanceSegmented.selectedSegmentIndex {
        case 0:
            if ambulance == "yellow" {
                points -= 35
            }
            
            else if ambulance == "blue" {
                points -= 40
            }
            ambulance = ""
            pointsLabel.text = String(points)
            
            let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
            let values = ["ambulance": ambulance, "matchPoints": String(points)] as [String : Any]
            matchReference?.updateChildValues(values)
        case 1:
            if ambulance == "yellow" {
                points -= 35
            }
                
            else if ambulance == "blue" {
                points -= 40
            }
            ambulance = "yellow"
            points += 35
            pointsLabel.text = String(points)
            
            let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
            let values = ["ambulance": ambulance, "matchPoints": String(points)] as [String : Any]
            matchReference?.updateChildValues(values)
        case 2:
            if ambulance == "yellow" {
                points -= 35
            }
                
            else if ambulance == "blue" {
                points -= 40
            }
            ambulance = "blue"
            points += 40
            pointsLabel.text = String(points)
            
            let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
            let values = ["ambulance": ambulance, "matchPoints": String(points)] as [String : Any]
            matchReference?.updateChildValues(values)
        default:
            break
        }
    }
    
    @IBAction func chimneySegment(_ sender: UISegmentedControl) {
        switch chimneySegmented.selectedSegmentIndex {
        case 0:
            chimney = false
            points -= 60
            pointsLabel.text = String(points)
            let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
            let values = ["chimney": chimney, "matchPoints": String(points)] as [String : Any]
            matchReference?.updateChildValues(values)
        case 1:
            chimney = true
            points += 60
            pointsLabel.text = String(points)
            let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
            let values = ["chimney": chimney, "matchPoints": String(points)] as [String : Any]
            matchReference?.updateChildValues(values)
        default:
            break
        }
    }
    
    @IBAction func stairsSegment(_ sender: UISegmentedControl) {
        switch stairsSegmented.selectedSegmentIndex {
        case 0:
            stairs = false
            points -= 50
            pointsLabel.text = String(points)
            let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
            let values = ["stairs": stairs, "matchPoints": String(points)] as [String : Any]
            matchReference?.updateChildValues(values)
        case 1:
            stairs = true
            points += 50
            pointsLabel.text = String(points)
            let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
            let values = ["stairs": stairs, "matchPoints": String(points)] as [String : Any]
            matchReference?.updateChildValues(values)
        default:
            break
        }
    }
    
    @IBAction func tireStepper(_ sender: UIStepper) {
        points += (tirePenalty * 1)
        tirePenalty = Int(sender.value)
        points -= (tirePenalty * 1)
        tireLabel.text = String(tirePenalty)
        pointsLabel.text = String(points)
        
        let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
        let values = ["tirePenalty": tirePenalty, "matchPoints": String(points)] as [String : Any]
        matchReference?.updateChildValues(values)
    }
    
    @IBAction func powerLineSegment(_ sender: UISegmentedControl) {
        switch powerLineSegmented.selectedSegmentIndex {
        case 0:
            powerPenalty = false
            points += 20
            pointsLabel.text = String(points)
            let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
            let values = ["powerPenalty": powerPenalty, "matchPoints": String(points)] as [String : Any]
            matchReference?.updateChildValues(values)
        case 1:
            powerPenalty = true
            points -= 20
            pointsLabel.text = String(points)
            let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
            let values = ["powerPenalty": powerPenalty, "matchPoints": String(points)] as [String : Any]
            matchReference?.updateChildValues(values)
        default:
            break
        }
    }
    
    @IBAction func fieldDamageStepper(_ sender: UIStepper) {
        points += (fieldDamage * 5)
        fieldDamage = Int(sender.value)
        points -= (fieldDamage * 5)
        fieldDamageLabel.text = String(fieldDamage)
        pointsLabel.text = String(points)
        
        let matchReference = self.ref?.child("gameDay").child(selectedSession).child("current").child(currentMatch)
        let values = ["fieldDamage": fieldDamage, "matchPoints": String(points)] as [String : Any]
        matchReference?.updateChildValues(values)
    }
    
}
