//
//  SubViewController.swift
//  Anniversary
//
//  Created by J on 2022/07/14.
//

import UIKit

class SubViewController: UIViewController, UITextFieldDelegate {

   
    @IBOutlet weak var dateSearch: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        dateSearch.delegate = self
        
        
      
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dateSearch.resignFirstResponder()
        return true
    }
    
  
    @IBAction func keyboardDown(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
 
 
    
}
