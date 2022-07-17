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
        
        dateSearch.text = ""
        return true
    }
    
  // 배경 터치 시 모든 편집 중단
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
    
    // alert로 다음 페이지로 넘어가기
    @IBAction func diaryPlus(_ sender: UIBarButtonItem) {
        let alert = UIAlertController.init(title: "해당 내용을 저장하시겠습니까?", message: nil, preferredStyle: .alert)
        
        // identifier: viewcontroller의 고유한 식별자 (Storyboard ID속성)
        // instantiateViewController: 지정된 식별자로 뷰컨을 만들고 스토리보드의 데이터로 초기화 (인스턴스화)
        // as: 타입 캐스팅으로 업캐스팅 다운캐스팅이 존재,  (업캐스팅은 서브클래스의 인스턴스를 슈퍼클래스의 타입으로 참조,  다운캐스팅은 업캐스팅의 반대로 캐스팅 실패 가능성 때문에 !,?를 사용 ?사용시 무조건 optional 타입 명시)
        
        guard let vc = self.storyboard?.instantiateViewController(identifier: "vc") as? StorageViewController else {return}
        
        // closure: 익명함수로 변수나 상수 ,파라미터에 대입 가능 리턴가능...
        // 확인 누를 시 label 저장과 다음 뷰컨트롤러로 넘어감.
        let ok = UIAlertAction.init(title: "확인", style: .default, handler: { action in self.navigationController?.pushViewController(vc, animated: true)
            UserDefaults.standard.set(self.dateLabel.text, forKey: "text")
        })
        
        let cancle = UIAlertAction.init(title: "취소", style: .cancel, handler: nil)
        UserDefaults.standard.set(dateLabel.text, forKey: "text")
        
        alert.addAction(ok)
        alert.addAction(cancle)
        
        present(alert, animated: true)
    }
    
}
