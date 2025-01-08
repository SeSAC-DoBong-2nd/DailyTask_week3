//
//  ShoppingTableViewHeaderCell.swift
//  DailyTask_week2
//
//  Created by 박신영 on 1/3/25.
//

import UIKit

class ShoppingTableViewHeaderCell: UITableViewCell {
    
    static let identifier = "ShoppingTableViewHeaderCell"

    @IBOutlet var shoppingTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    override func awakeFromNib() {
        contentView.backgroundColor = .background0103
        
        shoppingTextField.placeholder = "무엇을 구매하실 건가요?"
        shoppingTextField.borderStyle = .none
        
        addButton.setButtonUIWithTitle(title: "추가", backgroundColor: .addButton0103, cornerRadius: 10)
    }
    
}
