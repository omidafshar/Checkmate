//
//  SignUpViewController.swift
//  checkmateTests
//
//  Created by Divi Kumar on 11/21/17.
//  Copyright © 2017 Divi Kumar. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage

class SignUpStepTwoViewController: UIViewController {

    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
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
                            guard let email = self.emailTextField.text else { return }
                            guard let phone = self.phoneNumberTextField.text else { return }
                            let id = (user?.uid)!
                            State.shared.currentUser.First = firstName
                            State.shared.currentUser.Last = lastName
                            State.shared.currentUser.Email = email
                            State.shared.currentUser.PhoneNumber = phone
                            State.shared.currentUser.plan = self.planType
                            State.shared.currentUser.addUsertoDB(id: id)
                            let imagePath = "Images/" + id + "_profile.jpg"
                            State.shared.currentUser.getInfoFromDB(id:id, completion: {self.getDataFromPath(path: imagePath, completion: { (data) in
                                if let data = data {
                                    let image = UIImage(data: data)
                                    State.shared.currentUser.profilePic = image!
                                    self.performSegue(withIdentifier: "signUpToNav", sender: self)
                                } else {
                                    self.performSegue(withIdentifier: "signUpToNav", sender: self)
                                }
                            })})
                            
                            


                            
                            

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
    
    func getDataFromPath(path: String, completion: @escaping (Data?) -> Void) {
        let storageRef = Storage.storage().reference()
        storageRef.child(path).getData(maxSize: 5 * 1024 * 1024) { (data, error) in
            if let error = error {
                print(error)
            }
            if let data = data {
                completion(data)
            } else {
                completion(nil)
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
