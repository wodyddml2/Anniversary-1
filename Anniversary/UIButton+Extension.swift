//
//  UIButton+Extension.swift
//  Anniversary
//
//  Created by J on 2022/07/21.
//

import UIKit

extension UIButton {
    func buttonStyle(_ imageName: String, _ selectedImageName: String) {
        self.setTitle("", for: .normal)
        self.setImage(UIImage(systemName: imageName), for: .normal)
        self.tintColor = .black
        self.setImage(UIImage(systemName: selectedImageName), for: .selected)
        self.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    @objc func buttonClicked() {
        if self.isSelected == true {
            self.isSelected = false
            
        } else {
            self.isSelected = true
            
        }
    }
}

