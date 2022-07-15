//
//  TranstionThirdViewController.swift
//  Anniversary
//
//  Created by J on 2022/07/15.
//

import UIKit

class TranstionThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 이 액션이 실행되는지 알고 싶을 때
        print("Third",#function)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Third",#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Third",#function)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Third",#function)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Third",#function)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
