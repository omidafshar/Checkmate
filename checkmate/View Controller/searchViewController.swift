//
//  searchViewController.swift
//  checkmate
//
//  Created by Manoj Adhikari on 12/3/17.
//  Copyright © 2017 Divi Kumar. All rights reserved.
//

import UIKit

class searchViewController: UIViewController {
    var curProfile: UserProfile?
    
    @IBOutlet weak var userProfileButton: UIButton!
    
    
    @IBAction func HistoryButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "userProfileToCheckHistory", sender: self)
    }
    
    @IBAction func userProfileButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "profileImageToCheck", sender: self)
    }
    
    @IBAction func settingsButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "userProfileToUserSettings", sender: self)
    }
    
    @IBAction func inviteButtonPressed(_ sender: Any) {
//        performSegue(withIdentifier: "userProfileToInvite", sender: self)

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier != nil) {
            let identifier = segue.identifier!
            let destination = segue.destination
            if (identifier == "profileImageToCheck") {
                let controller = destination as! userProfileViewController
                controller.curProfile = UserProfile()
            } else if (identifier == "userProfileToUserSettings") {
                let controller = destination as! userSettingsViewController

            } else if (identifier == "userProfileToInvite") {
                
            } else if (identifier == "userProfileToCheckHistory") {
                let controller = destination as! checkHistoryViewController
                controller.profilesChecked = (curProfile?.searchHistory)!
            } else {
                print("Invalid Segue. Not matched with any of the segues")
            }
            
        } else {
            print("The segue identifier was null")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userProfileButton.setImage(State.shared.currentUser.profilePic, for: [])
        print(5)
        curProfile = UserProfile()
        print((curProfile?.First)!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
