//
//  AdTableViewCell.swift
//  DailyTask_week2
//
//  Created by 박신영 on 1/4/25.
//

import UIKit

class AdTableViewCell: UITableViewCell {
    
    static let identifier = "AdTableViewCell"
    let randomTitleText = ["하와이 여행을 가고 싶다면? 수업이 있는데 떠나실 생각은 아니시죠?", "도쿄 여행 예약은? Xcode로 직접 만드시면 되겠네요!"].randomElement() ?? "adTitleLabel error"

    @IBOutlet var adBackgroundView: UIView!
    @IBOutlet var adTitleLabel: UILabel!
    @IBOutlet var adButton: UIButton!
    
    override func awakeFromNib() {
        adBackgroundView.layer.cornerRadius = 10
        adBackgroundView.layer.borderWidth = 0
        
        adButton.setButtonUIWithTitle(title: "AD", backgroundColor: .white, cornerRadius: 8)
        adButton.titleLabel?.font = .systemFont(ofSize: 10)
        adButton.isUserInteractionEnabled = false //인터렉션 잠금
    }
    
    func setAdCellUI() {
        
        adTitleLabel.setLabelUI(randomTitleText,
                                     font: .systemFont(ofSize: 14, weight: .heavy),
                                     alignment: .center,
                                     numberOfLines: 2)
        
        let backgroundColor = [UIColor(resource: .adBackground1), UIColor(resource: .adBackground2)].randomElement() ?? .blue
        adBackgroundView.backgroundColor = backgroundColor
    }
    
}
