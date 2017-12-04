//
//  UserProfile.swift
//  checkmate
//
//  Created by Manoj Adhikari on 12/4/17.
//  Copyright © 2017 Divi Kumar. All rights reserved.
//

import Foundation
import UIKit

class UserProfile {
    var First: String
    var Last: String
    var profilePic: UIImage
    var DB1Status: String
    var DB2Status: String
    var DB3Status: String
    var lastCheckedDate: String
    var searchHistory:[UserProfile]


    init() {
        self.First = "Hello"
        self.Last = "World"
        self.profilePic = UIImage(named: "background")!
        self.DB1Status = ""
        self.DB2Status = ""
        self.DB3Status = ""
        self.lastCheckedDate = ""
        self.searchHistory = []
    }
    

    init(first: String, last: String, profilePic: UIImage, a: String, b: String, c: String, date:String) {
        self.First = first
        self.Last = last
        self.profilePic = profilePic
        self.DB1Status = a
        self.DB2Status = b
        self.DB3Status = c
        self.lastCheckedDate = date
        self.searchHistory = []
    }
}
