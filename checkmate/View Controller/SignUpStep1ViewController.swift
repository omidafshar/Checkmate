//
//  SignUpStep1ViewController.swift
//  checkmate
//
//  Created by Divi Kumar on 11/29/17.
//  Copyright © 2017 Divi Kumar. All rights reserved.
//

import UIKit

class SignUpStep1ViewController: UIViewController {

    var chosenPlan: String = ""
    
    
    @IBAction func basicPlanButtonPressed(_ sender: Any) {
        chosenPlan = "basic"
    }
    
    
    @IBAction func premiumPlanButtonPressed(_ sender: Any) {
        chosenPlan = "premium"
    }
    
    
    
    @IBAction func continueButtonPressed(_ sender: Any) {
        if chosenPlan == "" {
            let alertController = UIAlertController(title: "Invalid Selection.", message: "Please select a plan before continuing to the next step.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "SignUpOneToSignUpTwo", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != nil {
            if segue.identifier == "SignUpOneToSignUpTwo" {
                let dest = segue.destination as? SignUpStepTwoViewController
                dest?.planType = chosenPlan
            } else {
                print("Invalid Segue. Check your code")
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        /// Constructing the background layer \\\
        let gradientlayer = CAGradientLayer()
        gradientlayer.frame = self.view.frame
        gradientlayer.colors = [UIColor.flatOrangeDark.cgColor, UIColor.flatNavyBlue.cgColor,UIColor(red: 70/255.5, green: 146/255.5, blue: 150/255.5, alpha: 1.0).cgColor ]
        gradientlayer.locations = [0.0, 0.6, 1.0]
        gradientlayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientlayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        self.view.layer.insertSublayer(gradientlayer, at: 0)
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
