//
//  SubViewController.swift
//  Anniversary
//
//  Created by J on 2022/07/14.
//

import UIKit

class SubViewController: UIViewController, UITextFieldDelegate {

    class Anniversary {
        var one = "오늘은 널 만난지 100일"
        var two = "오늘은 널 만난지 200일"
        var three = "오늘은 널 만난지 300일"
        var four = "오늘은 널 만난지 400일"
        
       
        func anniversary(_ a: UILabel) {
            a.text = ""
            a.textColor = UIColor.darkGray
            a.numberOfLines = 0
        }
        override func anniversary(_ a: UILabel) {
            
        }
        
    }
   
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
