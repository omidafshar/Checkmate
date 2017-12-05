//
//  SignInViewController.swift
//  checkmate
//
//  Created by Divi Kumar on 11/29/17.
//  Copyright © 2017 Divi Kumar. All rights reserved.
//

import UIKit
import ChameleonFramework
import FirebaseAuth

class SignInViewController: UIViewController {
    
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var emailInput: UITextField!
    
    @IBOutlet weak var passwordInput: UITextField!
    
    
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        guard let email = emailInput.text else { return }
        guard let password = passwordInput.text else { return }
        
        if email == "" || password == "" {
            //Alert to tell the user that there was an error because they didn't fill anything in the fields
            let alertController = UIAlertController(title: "Log In Error", message: "Please enter a valid email and password.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if (error != nil) {
                    let alertController = UIAlertController(title: "Log In Error", message:
                        error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    // self.performSegue(withIdentifier: segueLogInToMainPage, sender: self)
                    let alertController = UIAlertController(title: "Response", message: "Signed in!", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
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
