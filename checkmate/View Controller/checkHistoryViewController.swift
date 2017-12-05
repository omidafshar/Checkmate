//
//  checkHistoryViewController.swift
//  checkmate
//
//  Created by Divi Kumar on 11/29/17.
//  Copyright © 2017 Divi Kumar. All rights reserved.
//

import UIKit

class checkHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var profilesChecked: [UserProfile] = []
    
    @IBOutlet weak var checkHistoryTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profilesChecked.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "checkHistoryView", for: indexPath)
            as! checkHistoryCell
        print(indexPath.row)
        let user = profilesChecked[indexPath.row]
        cell.userImage.image = user.profilePic
        cell.userNameLabel.text = user.First + " " + user.Last
        cell.userCheckedHistory.text = user.lastCheckedDate
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        checkHistoryTableView.delegate = self
//        checkHistoryTableView.dataSource = self

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
