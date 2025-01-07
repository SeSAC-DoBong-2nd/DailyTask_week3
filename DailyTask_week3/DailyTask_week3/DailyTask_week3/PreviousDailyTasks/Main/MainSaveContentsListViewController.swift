//
//  MainSaveContentsListViewController.swift
//  1st-Task_MovieProject
//
//  Created by 박신영 on 12/30/24.
//

import UIKit

class MainSaveContentsListViewController: UIViewController {

    @IBOutlet var navItem: UINavigationItem!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var settingBtn: UIButton!
    @IBOutlet var aroundContentsBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    
    func setUI() {
        view.backgroundColor = .black
        
        navItem.title = "저장한 콘텐츠 목록"
        
        titleLabel.text = "'나만의 자동 저장' 기능"
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        
        subtitleLabel.text = "취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다. 디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요."
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textColor = .lightGray
        subtitleLabel.textAlignment = .center
        
        mainImage.image = .dummy
        
        settingBtn.setTitle("설정하기", for: .normal)
        settingBtn.setTitleColor(.white, for: .normal)
        settingBtn.tintColor = .systemIndigo
        
        aroundContentsBtn.setTitle("저장 가능한 콘텐츠 살펴보기", for: .normal)
        aroundContentsBtn.setTitleColor(.black, for: .normal)
        aroundContentsBtn.tintColor = .white
        
        // 아래 코드는 왜 적용 안 될까?
        aroundContentsBtn.titleLabel?.font = .systemFont(ofSize: 10, weight: .heavy)
        
        
        [settingBtn, aroundContentsBtn].forEach({ i in
            i?.layer.cornerRadius = 8
        })
    }
    
}
