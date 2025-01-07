//
//  TamagotchiViewController.swift
//  DailyTask_week2
//
//  Created by 박신영 on 12/31/24.
//

import UIKit

class TamagotchiViewController: UIViewController {
    
    var nickname = ""
    var riceCount = 0
    var waterCount = 0
    var level = 1
    
    @IBOutlet var underLineView: UIView!
    @IBOutlet var navItem: UINavigationItem!
    @IBOutlet var navRightButton: UIBarButtonItem!
    @IBOutlet var bubbleImageView: UIImageView!
    
    @IBOutlet var tamagotchiImageView: UIImageView!
    
    @IBOutlet var bubbleLabel: UILabel!
    
    @IBOutlet var tamagotchiButton: UIButton!
    
    @IBOutlet var waterTextField: UITextField!
    @IBOutlet var infoLabel: UILabel!
    
    @IBOutlet var waterButton: UIButton!
    @IBOutlet var riceButton: UIButton!
    @IBOutlet var riceTextField: UITextField!
    @IBOutlet var underLineView2: UIView!
    @IBOutlet var riceContainer: UIView!
    
    @IBOutlet var waterContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background241231
        setUserdefaults()
        setNavUI()
        setTamagotchiUI()
        setBottomUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUserdefaults()
        updateUI()
    }
    
    func setUserdefaults() {
        let nickname = UserDefaults.standard.string(forKey: "nickname") ?? ""
        self.nickname = nickname.isEmpty ? "대장" : nickname
        
        self.riceCount = UserDefaults.standard.integer(forKey: "riceCount")
        self.waterCount = UserDefaults.standard.integer(forKey: "waterCount")
        self.level = UserDefaults.standard.integer(forKey: "level")
        
        if self.level == 0 { self.level = 1 }
        
        print("닉네임: \(self.nickname), 밥알: \(self.riceCount), 물방울: \(self.waterCount), 레벨: \(self.level)")
    }
    
    func saveUserdefaults() {
        UserDefaults.standard.set(self.riceCount, forKey: "riceCount")
        UserDefaults.standard.set(self.waterCount, forKey: "waterCount")
        UserDefaults.standard.set(self.level, forKey: "level")
    }
    
    func setNavUI() {
        navItem.setRightBarButton(navRightButton, animated: true)
        navItem.title = "\(self.nickname)님의 다마고치"
        
        navRightButton.image = UIImage(systemName: "person.circle")
        navRightButton.tintColor = .lightGray
        
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .lightGray
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func setTamagotchiUI() {
        bubbleImageView.contentMode = .scaleAspectFill
        bubbleImageView.image = .bubble
        
        bubbleLabel.numberOfLines = 0
        bubbleLabel.text = setTamagotchiComment()
        bubbleLabel.textAlignment = .center
        
        tamagotchiImageView.contentMode = .scaleAspectFit
        updateTamagotchiImage(level: self.level)
        
        tamagotchiButton.setTitle("방실방실 다마고치", for: .normal)
        tamagotchiButton.isUserInteractionEnabled = false
        tamagotchiButton.setTitleColor(.primary241231, for: .normal)
        tamagotchiButton.layer.cornerRadius = 10
        tamagotchiButton.layer.borderWidth = 1
        tamagotchiButton.layer.borderColor = UIColor.primary241231.cgColor
        
        updateUI()
    }
    
    func setBottomUI() {
        infoLabel.textAlignment = .center
        [underLineView, underLineView2].forEach { view in
            view?.layer.borderWidth = 1
            view?.layer.borderColor = UIColor.primary241231.cgColor
        }
        
        riceTextField.placeholder = "밥 주세용"
        waterTextField.placeholder = "물 주세용"
        [riceTextField, waterTextField].forEach { textField in
            textField?.borderStyle = .none
            textField?.keyboardType = .numberPad
        }
        
        [riceButton, waterButton].forEach { button in
            button?.layer.borderWidth = 1
            button?.layer.borderColor = UIColor.primary241231.cgColor
            button?.layer.cornerRadius = 10
            button?.setTitleColor(.primary241231, for: .normal)
        }
        riceButton.setTitle("밥 먹기", for: .normal)
        waterButton.setTitle("물 먹기", for: .normal)
    }
    
    func setTamagotchiComment() -> String {
        let tamagotchiMessages: [String] = [
            "배고파요, \(self.nickname)님! 밥 주세요!",
            "오늘도 힘내봐요, \(self.nickname)님!",
            "\(self.nickname)님, 저랑 놀아주세요!",
            "저는 행복해요, \(self.nickname)님 덕분에!",
            "\(self.nickname)님, 제 기분은 최고예요!",
            "잘 자요, \(self.nickname)님! 내일 또 봐요.",
            "운동은 했나요, \(self.nickname)님? 저도 같이 할래요!",
            "\(self.nickname)님, 밥 먹었어요? 저도 먹고 싶어요!",
            "우와, \(self.nickname)님 최고예요! 저도 닮고 싶어요.",
            "\(self.nickname)님, 오늘도 저를 돌봐줘서 고마워요!"
        ]
        
        return tamagotchiMessages.randomElement() ?? ""
    }
    
    func updateUI() {
        bubbleLabel.text = setTamagotchiComment()
        navItem.title = "\(self.nickname)님의 다마고치"
        
        infoLabel.text = "LV\(self.level) • 밥알 \(self.riceCount)개 • 물방울 \(self.waterCount)개"
        updateTamagotchiImage(level: self.level)
    }
    
    func updateTamagotchiImage(level: Int) {
        switch level {
        case 1:
            tamagotchiImageView.image = UIImage(resource: ._2_1)
        case 2:
            tamagotchiImageView.image = UIImage(resource: ._2_2)
        case 3:
            tamagotchiImageView.image = UIImage(resource: ._2_3)
        case 4:
            tamagotchiImageView.image = UIImage(resource: ._2_4)
        case 5:
            tamagotchiImageView.image = UIImage(resource: ._2_5)
        case 6:
            tamagotchiImageView.image = UIImage(resource: ._2_6)
        case 7:
            tamagotchiImageView.image = UIImage(resource: ._2_7)
        case 8:
            tamagotchiImageView.image = UIImage(resource: ._2_8)
        case 9:
            tamagotchiImageView.image = UIImage(resource: ._2_9)
        default:
            tamagotchiImageView.image = UIImage(resource: ._2_9)
        }
        
    }
    
    func calculateLevel() {
        let calculatedValue = Double(self.riceCount) / 5.0 + Double(self.waterCount) / 2.0
        
        let newLevel: Int
        if calculatedValue >= 100 {
            newLevel = 10
        } else {
            newLevel = Int(calculatedValue) / 10
        }
        
        if newLevel != self.level {
            self.level = newLevel
            updateTamagotchiImage(level: self.level)
        }
    }
    
    @IBAction
    func keyboardDismiss(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction
    func ricewaterButtonTapped(_ sender: UIButton) {
        var input = 0
        
        if sender == riceButton {
            input = Int(riceTextField.text ?? "0") ?? 0
            if input == 0 {
                self.riceCount += 1
            } else if input <= 99 {
                self.riceCount += input
                riceTextField.text = ""
            } else {
                bubbleLabel.text = "밥은 99개까지만 먹을 수 있어요!"
                riceTextField.text = ""
                return
            }
        } else if sender == waterButton {
            input = Int(waterTextField.text ?? "0") ?? 0
            if input == 0 {
                self.waterCount += 1
            } else if input <= 49 {
                self.waterCount += input
                waterTextField.text = ""
            } else {
                bubbleLabel.text = "물은 49개까지만 마실 수 있어요!"
                waterTextField.text = ""
                return
            }
        }
        
        calculateLevel()
        saveUserdefaults()
        updateUI()
    }
    
    @IBAction
    func unwindToPracticeViewController(_ sender: UIStoryboardSegue) {
        print(#function)
    }
    
}


/** 질문 모음
 1. navBar에 underLine이 필요하여 스토리보드에서 uiview로 추가한다고 가정하였을 때, 스토리보드 constraints로는 nav를 잡을 수 없던데 어떻게 해야할까?
 2. 스토리보드에 navBar에 shadowColor를 직접 주어도 적용되지 않아 let appearance = UINavigationBarAppearance() 코드를 활용하였는데, 스토리보드 상으로 설정한건 왜 적용되지 않았을까?
 3. UserDefaults.standard.synchronize() 이를 사용해도 userdefaults의 값이 빠르게 버튼을 누르고 재시작을 하였을 때 종료되기 직전의 값보다 작은 상황입니다.
 */
