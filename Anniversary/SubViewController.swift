//
//  SubViewController.swift
//  Anniversary
//
//  Created by J on 2022/07/14.
//

import UIKit

class SubViewController: UIViewController, UITextFieldDelegate {

    // 어려운 Class... 후우
    class Diary {
        var diary: [String] = []
       
        func anniversary(_ a: UILabel) {
            a.text = ""
            a.textColor = UIColor.darkGray
            a.font = UIFont.boldSystemFont(ofSize: 17)
            a.numberOfLines = 0
        }
        func anniversary(_ a: UILabel, _ b: UITextField) {
            guard let diaryText = b.text else {
                return
            }
            self.diary.append(diaryText)
            a.text = ""
            for i in 0...self.diary.count - 1 {
                
                a.text! += " \(self.diary[i])"
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
   
    @IBAction func diaryPlus(_ sender: UIBarButtonItem) {
        let alert = UIAlertController.init(title: "해당 내용을 저장하시겠습니까?", message: nil, preferredStyle: .alert)
        
        let ok = UIAlertAction.init(title: "확인", style: .default, handler: nil)
        
        let cancle = UIAlertAction.init(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancle)
        
        present(alert, animated: true)
    }
    
    
    
    
    // Label에 써진 글들을 다른 ViewController에 보내 저장하기 도전....

//    @IBAction func first(_ sender: UIBarButtonItem) {
//        guard let vc = storyboard?.instantiateViewController(identifier: "goTo") as? StorageViewController else {
//            return
//        }
//        vc.parr = self.dateLabel.text!
//
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    
}
