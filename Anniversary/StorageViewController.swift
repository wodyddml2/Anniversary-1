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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diaryBackground.backgroundColor = .clear
        diaryStory.numberOfLines = 0
        diaryStory.text = UserDefaults.standard.string(forKey: "text")
        diaryStory.textColor = .darkGray
        
        
        diaryTextStyle(diaryDay, 17)
        diaryDay.text = UserDefaults.standard.string(forKey: "day")
        
        
    }
    
    func diaryTextStyle(_ labelName: UILabel, _ fontSize: CGFloat) {
        labelName.font = .boldSystemFont(ofSize: fontSize)
        labelName.textAlignment = .center
        labelName.textColor = .darkGray
    }


    
}
