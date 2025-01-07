//
//  TopCitiesCollectionViewCell.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/8/25.
//

import UIKit

import Kingfisher

class TopCitiesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TopCitiesCollectionViewCell"
    
    var titleText: String?
    var subtitleText: String?
    var imageURL: String?

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.setLabelUI("", font: .boldSystemFont(ofSize: 14), alignment: .center)
        
        subtitleLabel.setLabelUI("", font: .systemFont(ofSize: 10, weight: .regular), textColor: .black.withAlphaComponent(0.7), alignment: .center, numberOfLines: 2)
        
        mainImageView.setImageViewUIWithKF(imageURL: "", cornerRadius: 70)
    }
    
    func setUI() {
        titleLabel.text = titleText ?? ""
        subtitleLabel.text = subtitleText ?? ""
        mainImageView.kf.setImage(with: URL(string: imageURL ?? ""))
    }

}
