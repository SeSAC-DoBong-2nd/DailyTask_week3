//
//  TravelTableViewCell.swift
//  DailyTask_week2
//
//  Created by 박신영 on 1/4/25.
//

import UIKit

class TravelTableViewCell: UITableViewCell {
    
    static let identifier = "TravelTableViewCell"

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var etcLabel: UILabel!
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var heartButton: UIButton!
    
    override func prepareForReuse() {
        titleLabel.text = nil
        subtitleLabel.text = nil
        etcLabel.text = nil
        travelImageView.image = nil
        heartButton.setImage(nil, for: .normal)
    }
    
    func setTravelCellUI(image: String?, titleText: String?, subtitleText: String?, grade: Double?, likeImage: String, save: Int?, starCnt: String) {
        guard let image,
              let titleText,
              let subtitleText,
              let grade,
              let save else {
            print("setTravelCellUI() guard let Error")
            return
        }
        
        travelImageView.setImageKfDownSampling(with: image, cornerRadius: 8)
        
        heartButton.setButtonUIWithImage(image: likeImage, tintColor: .red)
        
        titleLabel.setLabelUI(titleText, font: .boldSystemFont(ofSize: 16))
        
        subtitleLabel.setLabelUI(subtitleText,
                                      font: .systemFont(ofSize: 13, weight: .regular),
                                      textColor: .black.withAlphaComponent(0.8),
                                      numberOfLines: 2)
        
        let reviewCnt = (1...100).randomElement() ?? 0
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let saveCnt = numberFormatter.string(for: save) ?? "0"
        etcLabel.setLabelUI("\(starCnt) (\(reviewCnt)) 저장 \(saveCnt)",
                                 font: .systemFont(ofSize: 10, weight: .regular),
                                 textColor: .black.withAlphaComponent(0.4))
    }
    
}
