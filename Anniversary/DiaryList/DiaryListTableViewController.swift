//
//  DiaryListTableViewController.swift
//  Anniversary
//
//  Created by J on 2022/07/18.
//

import UIKit

class DiaryListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
       
    }
   
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if SubViewController.keyArr.isEmpty == true {
            return 0
        } else {
            return SubViewController.keyArr.count
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryListTableViewCell", for: indexPath) as? DiaryListTableViewCell
       
        cell?.diaryTitle.text = UserDefaults.standard.string(forKey: "\(indexPath.row)")
        
        cell?.favoriteButton.buttonStyle("star", "star.fill")
        
        
        
        return cell ?? tableView.dequeueReusableCell(withIdentifier: "DiaryListTableViewCell")!
    }
}
