//
//  SignUpViewController.swift
//  checkmateTests
//
//  Created by Divi Kumar on 11/21/17.
//  Copyright © 2017 Divi Kumar. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
