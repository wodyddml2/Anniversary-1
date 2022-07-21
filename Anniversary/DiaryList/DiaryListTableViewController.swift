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
        
        return UserDefaults.standard.array(forKey: "keyArray")?.count ?? 0
//        if SubViewController.keyArr.isEmpty == true {
//            return 0
//        } else {
//            return SubViewController.keyArr.count
//        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryListTableViewCell", for: indexPath) as? DiaryListTableViewCell
        
        // 텍스트 구현 요망
       
//        cell?.diaryTitle.text = UserDefaults.standard.object(forKey: "keyArray") as? String
        
        cell?.favoriteButton.buttonStyle("star", "star.fill")
        
        
        
        return cell ?? tableView.dequeueReusableCell(withIdentifier: "DiaryListTableViewCell")!
    }
}
