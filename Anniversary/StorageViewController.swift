//
//  StorageViewController.swift
//  Anniversary
//
//  Created by J on 2022/07/14.
//

import UIKit

class StorageViewController: UIViewController {

    @IBOutlet weak var la: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        la.text = UserDefaults.standard.string(forKey: "text")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
