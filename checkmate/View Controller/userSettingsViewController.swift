//
//  userSettingsViewController.swift
//  checkmate
//
//  Created by Manoj Adhikari on 12/4/17.
//  Copyright © 2017 Divi Kumar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class userSettingsViewController: UIViewController {
    
    
    @IBOutlet weak var userProfileImageView: UIImageView!
    
    @IBOutlet weak var userFirstNameLabel: UILabel!
    
    @IBOutlet weak var userLastNameLabel: UILabel!
    
    @IBOutlet weak var userEmailLabel: UILabel!
    
    @IBOutlet weak var userPhoneNumber: UILabel!
    
    
    
    
    
    @IBAction func EditPhotoButtonPressed(_ sender: Any) {
    }
    
    @IBAction func passwordButtonPressed(_ sender: Any) {
    }
    
    @IBAction func SignOutButtonPressed(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
//                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "firstNavigationController")
//                present(vc, animated: true, completion: nil)
                if let storyboard = self.storyboard {
                    let vc = storyboard.instantiateViewController(withIdentifier: "firstNavigationController") as! UINavigationController
                    var x = State.shared.currentUser
                    State.shared.currentUser = UserProfile()
                    self.present(vc, animated: false, completion: nil)
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
        //        try! Auth.auth().signOut()
        //        if let storyboard = self.storyboard {
        //            let vc = storyboard.instantiateViewController(withIdentifier: "firstNavigationController") as! UINavigationController
        //            self.present(vc, animated: false, completion: nil)
        //        }
        //        do{
        //            try Auth.auth().signOut()
        //            if let storyboard = self.storyboard {
        //                let vc = storyboard.instantiateViewController(withIdentifier: "firstNavigationController") as! UINavigationController
        //                self.present(vc, animated: false, completion: nil)
        //
        //            } catch let error as NSError do {
        //                print(error.localizedDescription)
        //            }
        //
        //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userProfileImageView.image = State.shared.currentUser.profilePic
        userFirstNameLabel.text = State.shared.currentUser.First
        userLastNameLabel.text = State.shared.currentUser.Last
        userPhoneNumber.text = State.shared.currentUser.PhoneNumber
        userEmailLabel.text = State.shared.currentUser.Email
        
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
