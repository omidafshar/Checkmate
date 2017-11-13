//
//  ViewController.swift
//  checkmate
//
//  Created by Divi Kumar on 11/12/17.
//  Copyright © 2017 Divi Kumar. All rights reserved.
//

import UIKit


class WelcomeScreenViewController: UIViewController {

    @IBOutlet weak var titleBackgorund: UITextView!
    @IBOutlet weak var titlefiled: UITextField!
    @IBAction func SignButtonPressed(_ sender: Any) {
        //Peform a Segue to Sign in View Controller
    }
    @IBOutlet weak var InformationText: UITextView!
    @IBOutlet var WelcomeScreenView: UIView!
    @IBOutlet weak var DisplayPhoto: UIImageView!
    
    @IBAction func AboutButtonPressed(_ sender: Any) {
        print("About Button Pressed")
        InformationText.text = "Welcome to the CheckMate community! On the next couple of screens we need to ask you a few personal questions so that we can perform the necessary checks to keep you safe. At SafetyKids our primary concern is your safety. Therefore, we can assure you that none of your information will be shared or seen by anybody.                       The CheckMate Team "
        
    }
    
    @IBAction func CancelButtonPressed(_ sender: Any) {
        print("Cancel Button Pressed")

    }
    
    @IBAction func PricingButtonPressed(_ sender: Any) {
        print("Pricing Button Pressed")

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titlefiled.isUserInteractionEnabled = false
        titleBackgorund.isUserInteractionEnabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

