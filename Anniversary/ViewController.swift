//
//  ViewController.swift
//  Anniversary
//
//  Created by J on 2022/07/13.
//

import UIKit

enum Location {
    case top
    case bottom
    case right
    case left
}



class ViewController: UIViewController {
 
    @IBOutlet var annivarsaryShadow: [UIView]!
    @IBOutlet var annivarsaryImage: [UIImageView]!
    @IBOutlet weak var annivarsaryDate: UIDatePicker!
    

    @IBOutlet var happyDay: [UILabel]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageBorder()
        shadowAdd(location: .bottom)
        annivarsaryDate.preferredDatePickerStyle = .inline
        annivarsaryDate.date = .now
        
        happydayLabel()
    }
    
    
// 이미지 테두리
    func imageBorder() {
        for i in annivarsaryImage {
            i.layer.masksToBounds = true
            i.layer.cornerRadius = 15
        }
    }
    
// 이미지 그림자 - enumerate 사용
    func shadowAdd(location: Location) {
        for i in annivarsaryShadow {
            i.backgroundColor = UIColor.clear
            i.layer.masksToBounds = false
            i.layer.shadowOpacity = 0.7
            i.layer.shadowRadius = 15
            i.layer.shadowColor = UIColor.black.cgColor
            
            switch location {
            case .top: i.layer.shadowOffset = CGSize(width: 0, height: -10)
            case .bottom: i.layer.shadowOffset = CGSize(width: 0, height: 10)
            case .right: i.layer.shadowOffset = CGSize(width: 10, height: 0)
            case .left: i.layer.shadowOffset = CGSize(width: -10, height: 0)
                
        }
      }
    }
    
    // 날짜 텍스트
    func happydayLabel() {
        for i in happyDay {
            i.textColor = UIColor.white
            i.text = ""
        }
    }
    
    // 날짜 변환 위한 함수
    func happydayLabelChanged(_ i:Int,_ a: Int) {
            happyDay[i].text = "\(annivarsaryDate.calendar.date(byAdding: .day, value: a, to: annivarsaryDate.date)?.formatted(date: .long, time: .omitted) ?? annivarsaryDate.date.formatted(date: .long, time: .omitted))"
    }
    
    // 날짜 변환
    @IBAction func annivarsaryPick(_ sender: UIDatePicker) {
        for s in 0...happyDay.count-1 {
            happydayLabelChanged(s, (s+1)*100)
        }
      
    }

}
