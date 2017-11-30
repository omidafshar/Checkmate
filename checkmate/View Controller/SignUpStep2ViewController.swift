//
//  SignUpViewController.swift
//  checkmateTests
//
//  Created by Divi Kumar on 11/21/17.
//  Copyright © 2017 Divi Kumar. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpStepTwoViewController: UIViewController {

    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    var planType: String = "basic"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
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
    
    
    @IBAction func basicButtonPressed(_ sender: Any) {
        planType = "basic"
    }
    
    
    
    @IBAction func premiumButtonPressed(_ sender: Any) {
        planType = "string"
    }
    
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let firstName = firstNameTextField.text else { return }
        guard let lastName = lastNameTextField.text else { return }
        guard let verifiedPassword = confirmPasswordTextField.text else { return }
        if email == "" || password == "" || firstName == "" || lastName == "" || verifiedPassword == "" {
            let alertController = UIAlertController(title: "Form Error.", message: "Please fill in form completely.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        } else if password != verifiedPassword {
            let alertController = UIAlertController(title: "Password Error.", message: "Passwords do not match.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Try Again", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        } else {
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                if error == nil {
                    // TO DO:
                    // The user account has been successfully created. Now, update the user's name in
                    // firebase and then perform a segue to the main page. Note, again, that this segue
                    // already exists somewhere, just do some simple debugging to find the identifier.
                    // Also, notify the user that the account has been successfully created before
                    // performing the segue.
                    
                    let changeRequest = user!.createProfileChangeRequest()
                    changeRequest.displayName = firstName + lastName
                    changeRequest.commitChanges() { (error) in
                        if let nameError = error {
                            // handle error
                            let alertController = UIAlertController(title: "Name Error", message: error?.localizedDescription, preferredStyle: .alert)
                            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            alertController.addAction(defaultAction)
                            self.present(alertController, animated: true, completion: nil)
                        } else {
                            // self.performSegue(withIdentifier: segueSignUpToProfile, sender: self)
                            let alertController = UIAlertController(title: "Signed up successfully!", message: error?.localizedDescription, preferredStyle: .alert)
                            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            alertController.addAction(defaultAction)
                            self.present(alertController, animated: true, completion: nil)
                        }
                    }
                    
                } else if password != verifiedPassword {
                    let alertController = UIAlertController(title: "Verification Error.", message: "The two passwords do not match.", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.confirmPasswordTextField.textColor = UIColor.red
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    let alertController = UIAlertController(title: "Sign Up Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
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
