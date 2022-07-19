//
//  DiaryListTableViewController.swift
//  Anniversary
//
//  Created by J on 2022/07/18.
//

import UIKit

class DiaryListTableViewController: UITableViewController {
    

    
    var keyArr:[String] = []
//    var keyID = UserDefaults.standard.integer(forKey: "keyCount")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        for i in 0...keyID {
//            guard let diaryTitle = UserDefaults.standard.string(forKey: "\(i)") else {
//                return
//            }
//            keyArr.append(diaryTitle)
//        }
//
        
       
    }
    func favorite(_ btn: UIButton) {
        btn.setTitle("", for: .normal)
        
        btn.setImage(UIImage(named: "star"), for: .normal)
        btn.setImage(UIImage(named: "star.fill"), for: .selected)
        btn.addTarget(btn, action: #selector(buttonClicked(_:)), for: .touchUpInside)
    }
    
    @objc func buttonClicked(_ btn:UIButton) {
        if btn.isSelected == false {
            btn.isSelected = true
        } else {
            btn.isSelected = false
        }
    }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keyArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryListTableViewCell", for: indexPath) as? DiaryListTableViewCell
        
        
        
        
        
        return cell ?? tableView.dequeueReusableCell(withIdentifier: "DiaryListTableViewCell")!
    }
}
