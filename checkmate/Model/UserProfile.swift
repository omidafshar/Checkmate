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
    var age: Int
    var profilePic: UIImage
    var res1: Int
    var res2: Int
    var res3: Int
    var lastCheckedDate: String
    var searchHistory:[UserProfile]


    init() {
        self.First = "Hello"
        self.Last = "World"
        self.profilePic = UIImage(named: "background")!
        self.res1 = 0
        self.res2 = 0
        self.res3 = 0
        self.age = 0
        self.lastCheckedDate = ""
        self.searchHistory = []
    }
    

    init(first: String, last: String, profilePic: UIImage, age: Int, a: Int, b: Int, c: Int, date:String) {
        self.First = first
        self.Last = last
        self.profilePic = profilePic
        self.res1 = a
        self.res2 = b
        self.res3 = c
        self.age = age
        self.lastCheckedDate = date
        self.searchHistory = []
    }
}
