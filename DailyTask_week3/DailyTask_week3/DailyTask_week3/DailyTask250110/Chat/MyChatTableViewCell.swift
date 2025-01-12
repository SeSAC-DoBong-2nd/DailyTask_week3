//
//  MyChatTableViewCell.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/12/25.
//

import UIKit

class MyChatTableViewCell: UITableViewCell {

    static let identifier = "MyChatTableViewCell"

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var chatContainer: UIView!
    @IBOutlet var chatLabel: UILabel!
    
    func setMyChatCellUI(date: String, message: String) {
        chatContainer.layer.cornerRadius = 8
        chatContainer.layer.borderWidth = 1
        chatContainer.layer.borderColor = UIColor.darkGray.cgColor
        chatContainer.backgroundColor = .lightGray
        
        dateLabel.setLabelUI(date, font: .systemFont(ofSize: 10, weight: .regular), alignment: .center)
        chatLabel.setLabelUI(message, font: .systemFont(ofSize: 13, weight: .regular), numberOfLines: 0)
    }
    
}
