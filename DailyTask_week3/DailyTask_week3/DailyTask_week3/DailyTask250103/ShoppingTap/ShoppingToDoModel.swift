//
//  ShoppingToDoModel.swift
//  DailyTask_week2
//
//  Created by 박신영 on 1/4/25.
//

import Foundation

struct ShoppingToDoModel {
    
    var isChecked: Bool
    var shoppingToDo: String
    var isStared: Bool
    
}

let shoppingToDoDummy = [
    ShoppingToDoModel(isChecked: false, shoppingToDo: "그립톡 구매하기", isStared: false),
    ShoppingToDoModel(isChecked: false, shoppingToDo: "사이다 구매", isStared: false),
    ShoppingToDoModel(isChecked: false, shoppingToDo: "아이패드 케이스 최저가 알아보기", isStared: false),
    ShoppingToDoModel(isChecked: false, shoppingToDo: "양말", isStared: false)
    ]
