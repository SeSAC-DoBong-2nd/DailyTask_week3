//
//  CityTableViewCell.swift
//  DailyTask_week2
//
//  Created by 박신영 on 1/7/25.
//

import UIKit

import Kingfisher

class CityTableViewCell: UITableViewCell {
    
    static let identifier = "CityTableViewCell"
    
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var bottomContainer: UIView!
    @IBOutlet var explainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.roundCorners(cornerRadius: 20, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMaxYCorner])
        
        cityImageView.contentMode = .scaleAspectFill
        
        cityNameLabel.font = .boldSystemFont(ofSize: 20)
        cityNameLabel.textColor = .white
        cityNameLabel.textAlignment = .right
        
        bottomContainer.backgroundColor = .black.withAlphaComponent(0.4)
        
        explainLabel.font = .systemFont(ofSize: 10, weight: .regular)
        explainLabel.textColor = .white
        explainLabel.textAlignment = .left
        
        self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0))
    }

    func setCityCellUI(image: String, cityNameText: String, explainText: String) {
        cityImageView.setImageKfDownSampling(with: image, cornerRadius: 0)
        cityNameLabel.text = cityNameText
        explainLabel.text = explainText
    }
    
}



