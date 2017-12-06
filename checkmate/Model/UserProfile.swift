//
//  UserProfile.swift
//  checkmate
//
//  Created by Manoj Adhikari on 12/4/17.
//  Copyright © 2017 Divi Kumar. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

class UserProfile {
    var First: String
    var plan: String
    var Last: String
    var age: Int
    var profilePic: UIImage
    var res1: Int
    var res2: Int
    var res3: Int
    var lastCheckedDate: String
    var searchHistory:[UserProfile]
    
    var username: String!
    var id: String!

    let dbRef = Database.database().reference()
    
    init() {
        self.First = "Hello"
        self.Last = "World"
        self.profilePic = UIImage(named: "default_profile_photo")!
        self.res1 = 2
        self.res2 = 2
        self.res3 = 2
        self.age = 21
        self.lastCheckedDate = ""
        self.plan = "basic"
        self.searchHistory = []
        
        let currentUser = Auth.auth().currentUser
        username = currentUser?.displayName
        id = currentUser?.uid
    }
    

    init(first: String, last: String, profilePic: UIImage, age: Int, a: Int, b: Int, c: Int, date:String, plan: String) {
        self.First = first
        self.Last = last
        self.profilePic = profilePic
        self.res1 = a
        self.res2 = b
        self.res3 = c
        self.age = age
        self.lastCheckedDate = date
        self.searchHistory = []
        self.plan = plan

        let currentUser = Auth.auth().currentUser
        username = currentUser?.displayName
        id = currentUser?.uid
    }
    
    func addUsertoDB() {
        
        dbRef.child("Users/\(id!)").setValue(["firstName": self.First, "lastName": self.Last, "profilePic": "Images/" + id + "_profile.jpg", "result1": self.res1, "result2": self.res2, "result3": self.res3, "lastCheckedDate": self.lastCheckedDate, "plan": self.plan, "age": self.age, "searchHistory": ""])
        
    }
    
    func getInfoFromDB(completion: @escaping () -> Void) {
        
        dbRef.child("Users/\(id!)").observeSingleEvent(of: .value, with: { snapshot -> Void in
            if snapshot.exists() {
                if let userData = snapshot.value as? [String:AnyObject] {
                    State.shared.currentUser = UserProfile(first: userData["firstName"] as! String, last: userData["lastName"] as! String, profilePic: UIImage(named: "default_profile_photo")!, age: userData["age"] as! Int, a: userData["result1"] as! Int, b: userData["result2"] as! Int, c: userData["result3"] as! Int, date: userData["lastCheckedDate"] as! String, plan: userData["plan"] as! String)
                    completion()
                } else {
                   
                }
            } else {
                
            }
        })
        
    }
    
}

class State {
    static var shared: State = State()
    
    var currentUser = UserProfile()
}

