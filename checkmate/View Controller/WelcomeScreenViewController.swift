//
//  ViewController.swift
//  checkmate
//
//  Created by Divi Kumar on 11/12/17.
//  Copyright © 2017 Divi Kumar. All rights reserved.
//

import UIKit
import ChameleonFramework

class WelcomeScreenViewController: UIViewController {

    @IBOutlet weak var checkMateTeam: UITextField!
    @IBAction func SignButtonPressed(_ sender: Any) {
        //Peform a Segue to Sign in View Controller
        performSegue(withIdentifier: "WelcomeToSignIn", sender: self)
    }
    
//    @IBAction func signUpButtonPressed(_ sender: Any) {
//        performSegue(withIdentifier: "WelcomeToSignUp", sender: self)
//    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier: String? = segue.identifier
        if identifier != nil {
            if identifier! == "WelcomeToSignIn" {
                
            } else if identifier == "WelcomeToSignUp" {
                
            } else {
                print("Incorrect Segue Identifier")
            }
        }
    }
    
    
    
    @IBOutlet weak var InformationText: UITextView!
    @IBOutlet var WelcomeScreenView: UIView!
    
    @IBAction func AboutButtonPressed(_ sender: Any) {
        print("About Button Pressed")
        InformationText.text = "Welcome to the CheckMate community! On the next couple of screens we need to ask you a few personal questions so that we can perform the necessary checks to keep you safe. At SafetyKids our primary concern is your safety. Therefore, we can assure you that none of your information will be shared or seen by anybody."
        
    }
    
    @IBAction func CancelButtonPressed(_ sender: Any) {
        print("Cancel Button Pressed")

    }
    
    @IBAction func PricingButtonPressed(_ sender: Any) {
        print("Pricing Button Pressed")

    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradientlayer = CAGradientLayer()
        gradientlayer.frame = self.view.frame
        gradientlayer.colors = [UIColor.flatOrangeDark.cgColor, UIColor.flatNavyBlue.cgColor,UIColor(red: 70/255.5, green: 146/255.5, blue: 150/255.5, alpha: 1.0).cgColor ]
        gradientlayer.locations = [0.0, 0.6, 1.0]
        gradientlayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientlayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        self.view.layer.insertSublayer(gradientlayer, at: 0)
        InformationText.backgroundColor = UIColor.clear
        InformationText.textColor = UIColor.white
        checkMateTeam.backgroundColor = UIColor.clear
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

