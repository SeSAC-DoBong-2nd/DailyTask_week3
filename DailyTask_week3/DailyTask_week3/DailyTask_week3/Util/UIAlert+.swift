//
//  UIAlert+.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/8/25.
//

import UIKit

struct UIAlertUtil {
    
    static func showAlert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        return alert
    }
    
    static func showActionSheet(title: String, message: String, actionArr: [String]) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for i in actionArr {
            alert.addAction(UIAlertAction(title: i, style: .default))
        }
        return alert
    }
    
}
