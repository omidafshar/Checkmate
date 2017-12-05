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
                            guard let firstName = self.firstNameTextField.text else { return }
                            guard let lastName = self.lastNameTextField.text else { return }
                            State.shared.currentUser.First = firstName
                            State.shared.currentUser.Last = lastName
                            self.performSegue(withIdentifier: "signUpToNav", sender: self)
                            
                            


                            
                            

//                            let alertController = UIAlertController(title: "Signed up successfully!", message: error?.localizedDescription, preferredStyle: .alert)
//                            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                            alertController.addAction(defaultAction)
//                            self.present(alertController, animated: true, completion: nil)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier != nil) {
            let identifier = segue.identifier!
            let destination = segue.destination
            if (identifier == "segueSignUpToProfile") {
                let controller = destination as! searchViewController
                // TODO: Calculate the age rather than hardcoding it

//            } else if (identifier == "userProfileToUserSettings") {
//                let controller = destination as! userSettingsViewController
//
//            } else if (identifier == "userProfileToInvite") {
//
//            } else if (identifier == "userProfileToCheckHistory") {
//                let controller = destination as! checkHistoryViewController
//                controller.profilesChecked = (curProfile?.searchHistory)!
            } else if (identifier == "signUpToNav") {
//                let user = UserProfile()
//                (destination as! )
            } else {
                print("Invalid Segue. Not matched with any of the segues")
            }
            
        } else {
            print("The segue identifier was null")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
