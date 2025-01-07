//
//  AdViewController.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/7/25.
//

import UIKit

class AdViewController: UIViewController {
    
    var adTitleText: String?

    @IBOutlet var adTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        adTitleLabel.setLabelUI(adTitleText ?? "", font: .boldSystemFont(ofSize: 30), numberOfLines: 3)
    }

}
