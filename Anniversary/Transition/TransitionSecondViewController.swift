//
//  TransitionSecondViewController.swift
//  Anniversary
//
//  Created by J on 2022/07/15.
//

import UIKit

class TransitionSecondViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var mottoText: UITextView!
    
/*
 1. 앱 실행 후 데이터 가져와서 텍스트 뷰에 보여준다.
 2. 바뀐 데이터 저장.
=> UserDefaluts - key value 형태
 */
    override func viewDidLoad() {
        super.viewDidLoad()
        // 이 액션이 실행되는지 알고 싶을 때
        print("Second",#function)
        
        if UserDefaults.standard.string(forKey: "nickname") != nil {
            // 가지고 온다.
            mottoText.text = UserDefaults.standard.string(forKey: "nickname")
        } else {
            mottoText.text = "fighting"
        }
        countLabel.text = "\( UserDefaults.standard.integer(forKey: "count"))"
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Second",#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Second",#function)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Second",#function)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Second",#function)
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        UserDefaults.standard.set(mottoText.text, forKey: "nickname")
        print("저장")
       
    }
   
    @IBAction func countButton(_ sender: UIButton) {
       let currentValue =  UserDefaults.standard.integer(forKey: "count")
        let updateValue = currentValue + 1
            
            UserDefaults.standard.set(updateValue, forKey: "count")
        countLabel.text = "\( UserDefaults.standard.integer(forKey: "count"))"
        
    }
    /*
    // MARK: - Navigation 그럼 혹시 저장된 key를 삭제할 수 있는 방법은 있을까요?

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
