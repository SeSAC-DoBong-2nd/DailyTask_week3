//
//  EmotionDiaryViewController.swift
//  1st-Task_MovieProject
//
//  Created by 박신영 on 12/26/24.
//

import UIKit

class EmotionDiaryViewController: UIViewController {
    
    @IBOutlet var navLeftItem: UIBarButtonItem!
    
    @IBOutlet var happyBtn: UIButton!
    @IBOutlet var happyBtnLabel: UILabel!
    
    @IBOutlet var loveBtn: UIButton!
    @IBOutlet var loveBtnLabel: UILabel!
    
    @IBOutlet var likeBtn: UIButton!
    @IBOutlet var likeBtnLabel: UILabel!
    
    @IBOutlet var panicBtn: UIButton!
    @IBOutlet var panicBtnLabel: UILabel!
    
    @IBOutlet var upsetBtn: UIButton!
    @IBOutlet var upsetBtnLabel: UILabel!
    
    @IBOutlet var depresseBtn: UIButton!
    @IBOutlet var depresseBtnLabel: UILabel!
    
    @IBOutlet var boredBtn: UIButton!
    @IBOutlet var boredBtnLabel: UILabel!
    
    @IBOutlet var languidBtn: UIButton!
    @IBOutlet var languidBtnLabel: UILabel!
    
    @IBOutlet var sadBtn: UIButton!
    @IBOutlet var sadBtnLabel: UILabel!
    
    var btnClickCountArr = [0, 0, 0, 0, 0, 0, 0, 0, 0] //:배열을 사용한 경우
//    var btnClickCounts: [Int: Int] = [:] // :딕셔너리를 사용한 경우 (key = 버튼의 tag, value = 클릭 횟수)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        
        navLeftItem.image = UIImage(systemName: "list.triangle")
        navLeftItem.tintColor = .lightGray
        
        setBtnClickCount()
        setUI()
    }
    
    func setUI() {
        let btnArr = [happyBtn, loveBtn, likeBtn, panicBtn, upsetBtn, depresseBtn, boredBtn, languidBtn, sadBtn]
        
        let btnImageArr = [UIImage(resource: .monoSlime1), UIImage(resource: .monoSlime2), UIImage(resource: .monoSlime3), UIImage(resource: .monoSlime4), UIImage(resource: .monoSlime5), UIImage(resource: .monoSlime6), UIImage(resource: .monoSlime7), UIImage(resource: .monoSlime8), UIImage(resource: .monoSlime9)]
        
        let btnLabelArr = [happyBtnLabel, loveBtnLabel, likeBtnLabel, panicBtnLabel, upsetBtnLabel, depresseBtnLabel, boredBtnLabel, languidBtnLabel, sadBtnLabel]
        
        let btnLabelCommentArr = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "나른해", "슬퍼"]
        
        let btnClickCountArr = btnClickCountArr
        
        for index in 0..<btnImageArr.count {
            btnArr[index]?.tag = index
            btnArr[index]?.setImage(btnImageArr[index], for: .normal)
            btnLabelArr[index]?.text = "\(btnLabelCommentArr[index]) \(btnClickCountArr[index])"
            btnLabelArr[index]?.textAlignment = .center
        }
    }
    
    @IBAction
    func emotionBtnTapped(_ sender: UIButton) {
        btnClickCountArr[sender.tag] += 1 // 배열을 사용
//        btnClickCounts[sender.tag, default: 0] += 1
        
        let btnLabelCommentArr = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "나른해", "슬퍼"]
        let btnLabelArr = [happyBtnLabel, loveBtnLabel, likeBtnLabel, panicBtnLabel, upsetBtnLabel, depresseBtnLabel, boredBtnLabel, languidBtnLabel, sadBtnLabel]
        
        btnLabelArr[sender.tag]?.text = "\(btnLabelCommentArr[sender.tag]) \(btnClickCountArr[sender.tag])"
        
        //고차함수 map과 joined 이용하여 [Int] 타입 btnClickCountArr의 원소들을 문자열로 btnClickCountString에 저장
        let btnClickCountString = btnClickCountArr.map { String($0) }.joined(separator: "")
        
        print(btnClickCountString)
        saveBtnClickCount(btnClickCountString: btnClickCountString)
    }
    
    //클릭한 버튼의 개수(문자열)를 UserDefaults 활용하여 "btnClickCountString" 키 값에 저장
    func saveBtnClickCount(btnClickCountString: String) {
        UserDefaults.standard.set(btnClickCountString, forKey: "btnClickCountString")
    }
    
    //"btnClickCountString" 키 값에 저장된 값들을 불러와 ""이 아닐시 ""을 기준으로 나누는 split과 고차함수 map을 활용하여 self.btnClickCountArr에 값을 세팅
    func setBtnClickCount() {
        let btnClickCountString = UserDefaults.standard.string(forKey: "btnClickCountString") ?? ""
        if btnClickCountString != "" {
            self.btnClickCountArr = btnClickCountString.split(separator: "").map { Int($0) ?? 0 }
        }
        
    }
    
}
