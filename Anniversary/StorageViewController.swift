//
//  StorageViewController.swift
//  Anniversary
//
//  Created by J on 2022/07/14.
//

import UIKit

class StorageViewController: UIViewController {

    @IBOutlet weak var diaryDay: UILabel!
    @IBOutlet weak var diaryBackground: UIView!
    @IBOutlet weak var diaryStory: UILabel!
    
    @IBOutlet weak var okButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diaryBackground.backgroundColor = .clear
        diaryStory.numberOfLines = 0
        diaryStory.text = UserDefaults.standard.string(forKey: "text")
        diaryStory.textColor = .darkGray
        
        
        diaryTextStyle(diaryDay, 17)
        diaryDay.text = UserDefaults.standard.string(forKey: "day")
        
        okButtonStyle()
    }
    
    // 날짜 스타일
    func diaryTextStyle(_ labelName: UILabel, _ fontSize: CGFloat) {
        labelName.font = .boldSystemFont(ofSize: fontSize)
        labelName.textAlignment = .center
        labelName.textColor = .darkGray
    }
    
    // 버튼 스타일
    func okButtonStyle() {
        okButton.layer.masksToBounds = true
        okButton.layer.cornerRadius = 10
        okButton.backgroundColor = .lightGray
        okButton.setTitle("ok", for: .normal)
        okButton.setTitleColor(.white, for: .normal)
        okButton.setTitleColor(.systemIndigo, for: .highlighted)
    }

    // unwind 연결
    @IBAction func okButtonClicked(_ sender: UIButton) {
    }
    
    
}
