//
//  SubViewController.swift
//  Anniversary
//
//  Created by J on 2022/07/14.
//

import UIKit

class SubViewController: UIViewController, UITextFieldDelegate {

    class Diary {
//        var one = "오늘은 널 만난지 100일"
//        var two = "오늘은 널 만난지 200일"
//        var three = "오늘은 널 만난지 300일"
//        var four = "오늘은 널 만난지 400일"
        var diary: [String] = []
       
        func anniversary(_ a: UILabel) {
            a.text = ""
            a.textColor = UIColor.darkGray
            a.numberOfLines = 0
        }
        func anniversary(_ a: UILabel, _ b: UITextField) {
            guard let diaryText = b.text else {
                return
            }
            self.diary.append(diaryText)
            a.text = " "
            for i in 0...self.diary.count - 1 {
                
                a.text! += self.diary[i]
            }
        }
        
    }
    let firstDiary = Diary()
    
    @IBOutlet weak var dateSearch: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        dateSearch.delegate = self
        
        firstDiary.anniversary(dateLabel)
        dateSearch.placeholder = "서로의 이야기를 적어주세요 :)"
      
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dateSearch.resignFirstResponder()
        firstDiary.anniversary(dateLabel, dateSearch)
        dateSearch.text = ""
        return true
    }
    
  
    @IBAction func keyboardDown(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
 
 
    
}
