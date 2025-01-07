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

        setUI()
    }
    
    func setUI() {
        let leftBtn = UIBarButtonItem(title: "X",
                                      style: .plain,
                                      target: self,
                                      action: #selector(leftBtnTapped))
        navigationItem.leftBarButtonItem = leftBtn
        
        adTitleLabel.setLabelUI(adTitleText ?? "", font: .boldSystemFont(ofSize: 30), numberOfLines: 3)
    }
    
    @objc
    func leftBtnTapped() {
        dismiss(animated: true)
    }
    
}
