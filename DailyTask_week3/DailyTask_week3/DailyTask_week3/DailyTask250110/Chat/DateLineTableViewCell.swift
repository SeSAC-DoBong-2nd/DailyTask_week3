//
//  DateLineTableViewCell.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/12/25.
//

import UIKit

class DateLineTableViewCell: UITableViewCell {
    
    static let identifier = "DateLineTableViewCell"

    @IBOutlet var dateLineContainerView: UIView!
    @IBOutlet var leftImageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var rightImageView: UIImageView!
    
    func setDateLineCellUI(date: String) {
        dateLineContainerView.layer.cornerRadius = 16
        dateLineContainerView.backgroundColor = ._250110TextFieldBackground
        dateLineContainerView.layer.borderWidth = 0
        
        leftImageView.image = UIImage(systemName: "calendar")
        leftImageView.tintColor = .darkGray
        
        rightImageView.image = UIImage(systemName: "chevron.right")
        rightImageView.tintColor = .darkGray
        
        dateLabel.setLabelUI(date, font: .systemFont(ofSize: 10, weight: .regular), alignment: .center)
    }
    
}
