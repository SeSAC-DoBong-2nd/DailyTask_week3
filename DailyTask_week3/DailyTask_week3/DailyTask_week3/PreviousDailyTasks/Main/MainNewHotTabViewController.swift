//
//  MainNewHotTabViewController.swift
//  1st-Task_MovieProject
//
//  Created by 박신영 on 12/27/24.
//

import UIKit

class MainNewHotTabViewController: UIViewController {
    
    @IBOutlet var navItem: UINavigationItem!
    @IBOutlet var titleCommentLabel: UILabel!
    @IBOutlet var subtitleCommentLabel: UILabel!
    
    @IBOutlet var firstBtn: UIButton!
    @IBOutlet var secondBtn: UIButton!
    @IBOutlet var thirdBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        topBtnAction(firstBtn)
    }
//    다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요.
    func setUI() {
        view.backgroundColor = .black
        
        navItem.title = "NEW & HOT 검색"
        
        [firstBtn, secondBtn, thirdBtn].forEach({ i in
            i?.layer.cornerRadius = 8
        })
        
        firstBtn.setImage(.blue, for: .normal)
        firstBtn.setTitle("공개 예정", for: .normal)
        
        secondBtn.setImage(.turquoise, for: .normal)
        secondBtn.setTitle("모두의 인기 콘텐츠", for: .normal)
        
        thirdBtn.setImage(.pink, for: .normal)
        thirdBtn.setTitle("TOP 10 시리즈", for: .normal)
        
        [titleCommentLabel, subtitleCommentLabel].forEach({ i in
            i?.textAlignment = .center
            i?.textColor = .white
        })
    }

    @IBAction func topBtnAction(_ sender: UIButton) {
        let btnArr = [firstBtn, secondBtn, thirdBtn]
        
        for i in btnArr {
            if i == sender {
                i?.backgroundColor = .white
                i?.setTitleColor(.black, for: .normal)
            } else {
                i?.backgroundColor = .black
                i?.setTitleColor(.white, for: .normal)
            }
        }
        
        let titleCommentsArr = ["이런! 찾으시는 작품이 없습니다.", "이런런! 배가 고픕니다!", "허걱! 지각입니다!"]
        let subtitleCommentsDic: [String: String] = [
            "이런! 찾으시는 작품이 없습니다.": "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요.",
            "이런런! 배가 고픕니다!": "한식, 양식, 중식, 일식 등 메뉴를 검색해 보세요.",
            "허걱! 지각입니다!": "버스, 택시, 지하철 등 이동할 대중교통을 검색해 보세요."
        ]
        
        titleCommentLabel.text = titleCommentsArr.randomElement()
        subtitleCommentLabel.text = subtitleCommentsDic[titleCommentLabel.text ?? ""]
    }
    
}
