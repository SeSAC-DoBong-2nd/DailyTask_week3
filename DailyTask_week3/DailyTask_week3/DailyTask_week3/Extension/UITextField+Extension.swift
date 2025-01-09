//
//  UITextField+Extension.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/9/25.
//

import UIKit

extension UITextField {
    
    func setTextField(font: UIFont, placeholder: String, textAlignment: NSTextAlignment, backgroundColor: UIColor) {
        self.placeholder = placeholder
        self.textAlignment = textAlignment
        self.font = font
        self.backgroundColor = backgroundColor
    }
    
    //viewDidLayoutSubviews 함수 오버라이딩하여 그 안에 사용.
    //레이아웃에 걸린 addSubView같은(레이어도 뷰의 하위) 것들이 모두 완료 된 후 호출되기에 그 타이밍에 underline을 생성하는 것.
    func setTextFieldUnderline(color: UIColor) {
        self.borderStyle = .none
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = color.cgColor
        border.frame =
        CGRect(x: 0, y: self.frame.size.height - width,
               width:  self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
}
