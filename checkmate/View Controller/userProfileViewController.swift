//
//  userProfileViewController.swift
//  checkmate
//
//  Created by Divi Kumar on 11/29/17.
//  Copyright © 2017 Divi Kumar. All rights reserved.
//

import UIKit

class userProfileViewController: UIViewController {

    @IBOutlet weak var userProfileImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UITextField!
    
    @IBOutlet weak var userAgeLabel: UITextField!
    
    @IBOutlet weak var verificationStatusBar: UIImageView!
    
    @IBOutlet weak var lastCheckUpdatedLabel: UILabel!
    
    
    
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
        userProfileImageView.clipsToBounds = true

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
