//
//  GameCollectionViewCell.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/9/25.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "GameCollectionViewCell"

    @IBOutlet var backView: UIView!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = .systemFont(ofSize: 10)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.textColor = nil
        backView.backgroundColor = nil
    }
    
    func setUI(titleColor: UIColor, backgroundColor: UIColor) {
        titleLabel.textColor = titleColor
        
        backView.backgroundColor = backgroundColor
        backView.layer.cornerRadius = self.backView.frame.width / 2
    }
    
}
