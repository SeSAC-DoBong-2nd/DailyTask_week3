//
//  GroupTravelTalkCollectionViewCell.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/11/25.
//

import UIKit

class GroupTravelTalkCollectionViewCell: UICollectionViewCell {

    static let identifier = "GroupTravelTalkCollectionViewCell"
    
    @IBOutlet var imageContainerView: UIView!
    
    @IBOutlet var profileImageView1: UIImageView!
    @IBOutlet var profileImageView2: UIImageView!
    @IBOutlet var profileImageView3: UIImageView!
    @IBOutlet var profileImageView4: UIImageView!
    
    @IBOutlet var nicknameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    lazy var profileImageViewArr = [profileImageView1, profileImageView2, profileImageView3, profileImageView4]
    
    override func awakeFromNib() {
        
    }
    
    func setTravelTalkCellUI(image: [String], nickname: String, message: String, date: String) {
        for i in 0..<image.count {
            profileImageViewArr[i]?.setImageView(
                image: UIImage(named: image[i]) ?? UIImage(resource: ._2_1),
                cornerRadius: 39/2
            )
        }
        
        nicknameLabel.setLabelUI(nickname, font: .systemFont(ofSize: 14, weight: .black))
        
        messageLabel.setLabelUI(message, font: .systemFont(ofSize: 13, weight: .light))
        
        dateLabel.setLabelUI(date, font: .systemFont(ofSize: 12), alignment: .right)
    }

}
