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
    
    let format = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageBorder()
        shadowAdd(location: .bottom)
        annivarsaryDate.preferredDatePickerStyle = .inline
        annivarsaryDate.date = .now
        annivarsaryDate.setValue(UIColor.white, forKeyPath: "textColor")
        
        happydayLabel()
        
//
//        format.locale = Locale(identifier: "ko_kr")
//        format.timeZone = TimeZone(abbreviation: "KST")
//        format.dateFormat = "yyyy년 M월 d일"
//        for i in happyDay {
//            i.text = format.string(from: Date())
//        }
//
//        let dday = "1997년 12월 26일"
//        if let result = format.date(from: dday){
//            print(result)
//        } else {
//            print(Date())
//        }
//
        // 처음 화면에서 계산된 레이블 추가
        for s in 0...happyDay.count-1 {
            happydayLabelChanged(s, (s+1)*100)
        }
        
        // 글쓰는 페이지 날짜 형태
        format.dateFormat = "yyyy.MM.dd"

        // 임시방편
        UserDefaults.standard.set(format.string(from: annivarsaryDate.date), forKey: "day")
        
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
    
    
    @IBAction func annivarsaryPick(_ sender: UIDatePicker) {
        // 날짜 변환
        for s in 0...happyDay.count-1 {
            happydayLabelChanged(s, (s+1)*100)
        }
        
        // 클릭한 날짜 저장
        let currentDate = format.string(from: sender.date)
        
        
        UserDefaults.standard.set(currentDate, forKey: "day")
    
    }
    
    @IBAction func unwindVCA(firstSegue: UIStoryboardSegue) {
        
    }
    
    

}
