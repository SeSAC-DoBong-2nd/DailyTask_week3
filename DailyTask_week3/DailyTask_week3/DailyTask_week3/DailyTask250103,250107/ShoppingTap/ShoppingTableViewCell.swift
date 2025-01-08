//
//  ShoppingTableViewCell.swift
//  DailyTask_week2
//
//  Created by 박신영 on 1/3/25.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {
    
    static let identifier = "ShoppingTableViewCell"

    @IBOutlet var checkButton: UIButton!
    @IBOutlet var shoppingLabel: UILabel!
    @IBOutlet var starButton: UIButton!
    
    override func awakeFromNib() {
        contentView.backgroundColor = .background0103
    }
    
    func setShoppingMainCell(shoppingLabelText: String, checkImage: String, starImage: String) {
        shoppingLabel.setLabelUI(shoppingLabelText, font: .systemFont(ofSize: 14, weight: .medium))
        checkButton.setButtonUIWithImage(image: checkImage, tintColor: .black)
        starButton.setButtonUIWithImage(image: starImage, tintColor: .black)
    }
    
}
