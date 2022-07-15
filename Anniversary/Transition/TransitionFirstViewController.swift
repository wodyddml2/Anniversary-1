//
//  TransitionFirstViewController.swift
//  Anniversary
//
//  Created by J on 2022/07/15.
//

import UIKit

class TransitionFirstViewController: UIViewController {
    @IBOutlet weak var randomLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 이 액션이 실행되는지 알고 싶을 때
        print(#function)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        randomLabel.text = "\(Int.random(in: 0...5))"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    // 이렇게 화면 쌓임을 없애준다.
    @IBAction func unwindVC(jySegue: UIStoryboardSegue) {
        
    }
}
