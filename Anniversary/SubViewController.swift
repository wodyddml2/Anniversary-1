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
        func anniversaryAdd(_ a: UILabel, _ b: UITextField) {
            guard let diaryText = b.text else {
                return
            }
            self.diary.append(diaryText)
            a.text = ""
            for i in 0...self.diary.count - 1 {
                
                a.text! += " \(self.diary[i])"
            }
        }
        
        func anniversaryRemove(_ a: UILabel, _ b: UITextField) {
            guard b.text != nil else {
                return
            }
            
            a.text = ""
            for i in 0...self.diary.count - 1 {
                
                a.text! += " \(self.diary[i])"
            }
        }

        
    }
    
  
    
    let firstDiary = Diary()
    

    @IBOutlet weak var navigationTitle: UINavigationItem!
    
    @IBOutlet weak var dateSearch: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        dateSearch.delegate = self
        
        firstDiary.anniversary(dateLabel)
        dateSearch.placeholder = "서로의 이야기를 적어주세요 :)"
        
        navigationTitle.title = UserDefaults.standard.string(forKey: "day")
      
    }
    
    // Label에 Enter 칠 때마다 차례로 글자 입력
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dateSearch.resignFirstResponder()
        firstDiary.anniversaryAdd(dateLabel, dateSearch)
        UserDefaults.standard.set(dateLabel.text, forKey: "text")
        dateSearch.text = ""
        return true
    }
    
  
    @IBAction func keyboardDown(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // Label 문자 되돌리기, 텍스트가 비었을 경우 경고 메세지
    @IBAction func diaryReset(_ sender: UIBarButtonItem) {
        if dateLabel.text != "" {
            if firstDiary.diary.count == 1 {
                firstDiary.diary.removeLast()
                dateLabel.text = ""
            } else {
                firstDiary.diary.removeLast()
                firstDiary.anniversaryRemove(dateLabel, dateSearch)
            }
            
        } else if dateLabel.text == "" {
            let alert = UIAlertController.init(title: "경고", message: "텍스트가 비었습니다.", preferredStyle: .alert)
            
            let ok = UIAlertAction.init(title: "확인", style: .destructive, handler: nil)
        
            alert.addAction(ok)
            present(alert, animated: true)
        }
        
    }
    
    // 완성된 Label 다른 페이지에 저장하기 위한 초석이랄까...
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
