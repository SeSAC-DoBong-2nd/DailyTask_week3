//
//  OtherChatTableViewCell.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/12/25.
//

import UIKit

class OtherChatTableViewCell: UITableViewCell {
    
    static let identifier = "OtherChatTableViewCell"

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nicknameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var chatContainer: UIView!
    @IBOutlet var chatLabel: UILabel!
    
    func setOtherChatCellUI(user: String, date: String, message: String) {
        profileImageView.setImageView(
            image: UIImage(named: user) ?? UIImage(resource: ._2_1),
            cornerRadius: 33/2
        )
        
        chatContainer.layer.cornerRadius = 8
        chatContainer.layer.borderWidth = 1
        chatContainer.layer.borderColor = UIColor.lightGray.cgColor
        chatContainer.backgroundColor = .clear
        
        nicknameLabel.setLabelUI(user, font: .systemFont(ofSize: 12, weight: .regular))
        dateLabel.setLabelUI(date, font: .systemFont(ofSize: 10, weight: .regular), alignment: .center)
        chatLabel.setLabelUI(message, font: .systemFont(ofSize: 13, weight: .regular), numberOfLines: 0)
    }
    
}
