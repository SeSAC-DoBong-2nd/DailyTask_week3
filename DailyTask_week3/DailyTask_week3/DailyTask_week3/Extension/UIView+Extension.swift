//
//  UIView+Extension.swift
//  DailyTask_week2
//
//  Created by 박신영 on 1/7/25.
//

import UIKit

extension UIView {
    
    //특정 모서리 cornerRadius 적용하기
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
    
    func keyboardLayoutGuideUse(view: UIView) {
        self.keyboardLayoutGuide.topAnchor.constraint(
            equalToSystemSpacingBelow: view.bottomAnchor,
            multiplier: 1.0
        ).isActive = true
    }
    
}
