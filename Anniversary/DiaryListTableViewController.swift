//
//  DiaryListTableViewController.swift
//  Anniversary
//
//  Created by J on 2022/07/18.
//

import UIKit

class DiaryListTableViewController: UITableViewController {
    

    
    var keyArr:[String] = []
    var keyID = UserDefaults.standard.integer(forKey: "keyCount")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...keyID {
            guard let diaryTitle = UserDefaults.standard.string(forKey: "\(i)") else {
                return
            }
            keyArr.append(diaryTitle)
        }
        // 자꾸 초기화가 됨;; notification,delegate 등등 다 안됌; 뷰끼리의 거리가 너무 멀어서인가; struct class 다른 파일로 만들어서해도 안됌; 다시 해보기
        print(keyArr)
       
    }

        
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
}
