//
//  userProfileViewController.swift
//  checkmate
//
//  Created by Divi Kumar on 11/29/17.
//  Copyright © 2017 Divi Kumar. All rights reserved.
//

import UIKit
import FirebaseStorage

class userProfileViewController: UIViewController {
    
    @IBOutlet weak var userProfileImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UITextField!
    
    @IBOutlet weak var userAgeLabel: UITextField!
    
    @IBOutlet weak var verificationStatusBar: UIImageView!
    
    @IBOutlet weak var lastCheckUpdatedLabel: UILabel!
    
    @IBOutlet weak var DateBase1Button: UIButton!
    
    @IBOutlet weak var DateBase2Button: UIButton!
    
    @IBOutlet weak var DateBase3Button: UIButton!
    
    
    @IBAction func updateCheckButtonPressed(_ sender: Any) {
        
    }
    
    
    @IBAction func NCDcheckButtonPressed(_ sender: Any) {
    }
    
    
    @IBAction func RSODcheckButtonPressed(_ sender: Any) {
    }
    
    
    @IBAction func DMVcheckButtonPressed(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userProfileImageView.image = State.shared.currentUser.profilePic
        userNameLabel.text = State.shared.currentUser.First
        userNameLabel.text = State.shared.currentUser.Last
        userAgeLabel.text = String(State.shared.currentUser.age)
        lastCheckUpdatedLabel.text = "Last Checked " + State.shared.currentUser.lastCheckedDate
        updateCheckButton()
        updateDetailButtons()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func  updateCheckButton() {
        let a = State.shared.currentUser.res1
        let b = State.shared.currentUser.res2
        let c = State.shared.currentUser.res3
        if (a == b && b == c && c == 2) {
            verificationStatusBar.image = UIImage(named: "noChecks")
        } else if (a == b && b == c && c == 0) {
            verificationStatusBar.image = UIImage(named: "verified")
        } else if (a == 1 || b == 1 || c == 1) {
            verificationStatusBar.image = UIImage(named: "please_review")
        }
    }
    
    func updateDetailButtons() {
        let a = State.shared.currentUser.res1
        let b = State.shared.currentUser.res2
        let c = State.shared.currentUser.res3
        switch a {
        case 0:
            DateBase1Button.setImage(UIImage(named: "see_details"), for: [])
        break
        case 1:
            DateBase2Button.setImage(UIImage(named:"see_details_gold"), for: [])
        break
        case 2:
            DateBase3Button.setImage(UIImage(named: "nodetails"), for: [])
        break
        default:
            print("There was an error")
        }
        switch b {
        case 0:
            DateBase1Button.setImage(UIImage(named: "see_details"), for: [])
            break
        case 1:
            DateBase2Button.setImage(UIImage(named:"see_details_gold"), for: [])
            break
        case 2:
            DateBase3Button.setImage(UIImage(named: "nodetails"), for: [])
            break
        default:
            print("There was an error")
        }
        switch c {
        case 0:
            DateBase1Button.setImage(UIImage(named: "see_details"), for: [])
            break
        case 1:
            DateBase2Button.setImage(UIImage(named:"see_details_gold"), for: [])
            break
        case 2:
            DateBase3Button.setImage(UIImage(named: "nodetails"), for: [])
            break
        default:
            print("There was an error")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
