//
//  DateFormatter+.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/12/25.
//

import Foundation

class CustomDateFormatter {
    
    static let shard = CustomDateFormatter()
    
    private init() {}
    
    func setDateInTravelTalk(strDate: String) -> String {
        let inputDate = DateFormatter()
        let date = inputDate.date(from: strDate)
        
        let outputDate = DateFormatter()
        outputDate.dateFormat = "yy.MM.dd"
        
        return outputDate.string(from: date ?? Date())
    }
    
}
