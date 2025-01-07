//
//  NeologismFinderViewController.swift
//  1st-Task_MovieProject
//
//  Created by 박신영 on 12/28/24.
//

import UIKit

class NeologismFinderViewController: UIViewController {
    
    let neologismDic: [String: String] = [
        "킹받네": "매우 화가 난다는 뜻으로 '킹'과 '받다'를 결합한 표현",
        "억텐": "억지 텐션을 의미, 억지로 흥을 내는 상황",
        "억까": "억지로 까내린다는 뜻, 비난이나 비꼬는 말을 억지로 한다는 의미",
        "삼귀다": "'사귀다'의 이전 단계로, 썸을 타는 중이라는 뜻",
        "갑통알": "'갑자기 통장을 보니 알바해야 할 것 같다'의 줄임말",
        "오놀아놈": "'오늘도 놀라운 사람'의 줄임말로, 칭찬이나 감탄의 의미",
        "쪄죽따": "'쪄 죽어도 따뜻한 게 좋다'의 줄임말로, 더운 날씨에도 따뜻한 것을 선호한다는 뜻",
        "갓생": "갓처럼 완벽하게 사는 삶을 의미하는 신조어",
        "좋못사": "'좋아하지만 못 사귀는 사람'의 줄임말로, 짝사랑의 의미",
        "꾸안꾸": "'꾸민 듯 안 꾸민 듯'을 줄인 말로, 자연스러운 스타일링을 뜻함",
        "JMT": "엄청 맛있다는 것을 뜻함"
    ]
    
    @IBOutlet var recommendBtn1: UIButton!
    @IBOutlet var recommendBtn2: UIButton!
    @IBOutlet var recommendBtn3: UIButton!
    @IBOutlet var recommendBtn4: UIButton!
    
    @IBOutlet var topContainerView: UIView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    
    @IBOutlet var backgroundImageView: UIImageView!
    
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    func setUI() {
        topContainerView.layer.borderWidth = 2
        topContainerView.layer.borderColor = UIColor.black.cgColor
        
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .white
        searchButton.backgroundColor = .black
        
        searchTextField.borderStyle = .none
        
        backgroundImageView.image = .wordLogo
        backgroundImageView.contentMode = .scaleAspectFill
        
        resultLabel.textColor = .black
        resultLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        resultLabel.numberOfLines = 3
        resultLabel.textAlignment = .center
        resultLabel.isHidden = true
        
        let recommendBtnArr = [recommendBtn1, recommendBtn2, recommendBtn3, recommendBtn4]
        
        let recommendBtnTextArr: [String] = ["쪄죽따", "갓생", "좋못사", "꾸안꾸"]
        
        for i in 0..<recommendBtnArr.count {
            buttonSetUI(btn: recommendBtnArr[i] ?? UIButton(), text: recommendBtnTextArr[i])
        }
    }
    
    func buttonSetUI(btn: UIButton, text: String) {
        btn.setTitle(text, for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.layer.cornerRadius = 8
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.black.cgColor
    }

    @IBAction
    func keyboardDisMiss(_ sender: Any) {
        if let button = sender as? UIButton {
            if button == searchButton {
                backgroundImageView.image = .background1
                resultLabel.isHidden = false
                
                let text = (searchTextField.text ?? "").uppercased()
                
                if neologismDic[text] != nil {
                    resultLabel.text = neologismDic[text]
                } else {
                    resultLabel.text = "검색결과가 없습니다."
                }
            }
        }
        view.endEditing(true)
    }
    
    @IBAction
    func recommendBtnTapped(_ sender: UIButton) {
        backgroundImageView.image = .background1
        resultLabel.isHidden = false
        
        let title = sender.currentTitle
        searchTextField.text = title
        resultLabel.text = neologismDic[title ?? ""]
    }
    
}
