//
//  TouristPlaceViewController.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/7/25.
//

import UIKit

class TouristPlaceViewController: UIViewController {

    var titleText: String?
    var subtitleText: String?
    var mainImage: String?
    
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var bottomButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
    func setUI() {
        navigationItem.title = "관광지 화면"
        
        mainImageView.setImageKfDownSampling(with: mainImage ?? "", cornerRadius: 10)
        
        titleLabel.setLabelUI(titleText ?? "",
                              font: .boldSystemFont(ofSize: 30),
                              alignment: .center)
        
        subtitleLabel.setLabelUI(subtitleText ?? "",
                                 font: .boldSystemFont(ofSize: 25),
                                 alignment: .center,
                                 numberOfLines: 2)
        
        bottomButton.setButtonUIWithTitle(title: "다른 관광지 보러가기",
                                          titleColor: .white,
                                          backgroundColor: .cyan.withAlphaComponent(0.6),
                                          cornerRadius: 20)
    }
    
    @IBAction
    func popButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
