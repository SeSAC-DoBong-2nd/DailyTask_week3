//
//  TamagotchiUtil.swift
//  DailyTask_week2
//
//  Created by 박신영 on 12/31/24.
//

import UIKit

struct TamagotchiUtil {
    
    static func showAlert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        return alert
    }
    
}
