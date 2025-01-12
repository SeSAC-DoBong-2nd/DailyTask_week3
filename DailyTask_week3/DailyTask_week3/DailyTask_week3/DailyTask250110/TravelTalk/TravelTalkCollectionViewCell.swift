//
//  TravelTalkCollectionViewCell.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/11/25.
//

import UIKit

class TravelTalkCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TravelTalkCollectionViewCell"
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nicknameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setTravelTalkCellUI(image: [String], nickname: String, message: String, date: String) {
        profileImageView.setImageView(
            image: UIImage(named: image[0]) ?? UIImage(resource: ._2_1),
            cornerRadius: 77/2
        )
        
        nicknameLabel.setLabelUI(nickname, font: .systemFont(ofSize: 14, weight: .black))
        
        messageLabel.setLabelUI(message, font: .systemFont(ofSize: 13, weight: .light))
        
        dateLabel.setLabelUI(date, font: .systemFont(ofSize: 12), alignment: .right)
    }
    
}
