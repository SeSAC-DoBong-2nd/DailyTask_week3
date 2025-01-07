//
//  UIButton+Extension.swift
//  DailyTask_week2
//
//  Created by 박신영 on 1/5/25.
//

import UIKit

extension UIButton {
    
    func setButtonUIWithTitle(title: String, titleColor: UIColor = .black, backgroundColor: UIColor, cornerRadius: Int) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = CGFloat(cornerRadius)
    }
    
    func setButtonUIWithImage(image: String, tintColor: UIColor) {
        self.setImage(UIImage(systemName: image), for: .normal)
        self.tintColor = tintColor
    }
    
}
