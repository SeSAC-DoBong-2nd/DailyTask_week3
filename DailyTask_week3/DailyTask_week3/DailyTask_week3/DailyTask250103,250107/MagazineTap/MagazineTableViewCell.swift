//
//  MagazineTableViewCell.swift
//  DailyTask_week2
//
//  Created by 박신영 on 1/4/25.
//

import UIKit

class MagazineTableViewCell: UITableViewCell {
    
    static let identifier = "MagazineTableViewCell"

    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setMagazineCellUI(image: String, title: String, subtitle: String, date: String) {
        posterImageView.setImageKfDownSampling(with: image, cornerRadius: 20)
        
        titleLabel.setLabelUI(title,
                                   font: .boldSystemFont(ofSize: 20),
                                   numberOfLines: 2)
        
        subtitleLabel.setLabelUI(subtitle,
                                      font: .systemFont(ofSize: 12, weight: .regular),
                                      textColor: .black.withAlphaComponent(0.4))
        
        dateLabel.setLabelUI(date,
                                  font: .systemFont(ofSize: 10, weight: .regular),
                                  textColor: .black.withAlphaComponent(0.4),
                                  alignment: .right)
    }
    
}
