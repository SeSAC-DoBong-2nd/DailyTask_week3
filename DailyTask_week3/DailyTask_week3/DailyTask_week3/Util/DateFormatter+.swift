//
//  DateFormatter+.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/12/25.
//

import Foundation

final class CustomDateFormatter {
    
    static let shard = CustomDateFormatter()
    
    private init() {}
    
    let dateFormatter = DateFormatter()
    
    func setDateInTravelTalk(strDate: String) -> String {
        let inputDate = DateFormatter()
        let date = inputDate.date(from: strDate)
        
        let outputDate = DateFormatter()
        outputDate.dateFormat = "yy.MM.dd"
        
        return outputDate.string(from: date ?? Date())
    }
    
    func setDateInChat(strDate: String) -> String {
        let inputDate = DateFormatter()
        //strDate 형식에 맞는 포맷 설정
        inputDate.dateFormat = "yyyy-MM-dd HH:mm"

        guard let date = inputDate.date(from: strDate) else {
            print("Invalid date format: \(strDate)")
            return "Invalid Date"
        }

        let outputDate = DateFormatter()
        //원하는 출력 형식 포맷 설정
        outputDate.dateFormat = "HH.mm a"
        outputDate.locale = Locale(identifier: "ko_KR")

        return outputDate.string(from: date)
    }
    
    func setTodayDate() -> String {
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        return outputFormatter.string(from: Date())
    }

    
}
