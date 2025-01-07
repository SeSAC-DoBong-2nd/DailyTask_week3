//
//  NicknameSettingViewController.swift
//  DailyTask_week2
//
//  Created by 박신영 on 12/31/24.
//

import UIKit

class NicknameSettingViewController: UIViewController {
    
    var nickname = ""
    
    @IBOutlet var navItem: UINavigationItem!
    @IBOutlet var navleftButton: UIBarButtonItem!
    @IBOutlet var navRightButton: UIBarButtonItem!
    
    @IBOutlet var underlineView: UIView!
    @IBOutlet var nicknameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUserdefaults()
        setNavUI()
        setOtherUI()
    }
    
    func setUserdefaults() {
        let nickname = UserDefaults.standard.string(forKey: "nickname") ?? ""
        self.nickname = nickname.isEmpty ? "대장" :
        nickname
    }
    
    func setNavUI() {
        navleftButton.image = UIImage(systemName: "chevron.left")
        navleftButton.tintColor = .primary241231
        
        navRightButton.title = "저장"
        navRightButton.tintColor = .primary241231
        
        navItem.leftBarButtonItem = navleftButton
        navItem.title = "\(nickname)님 이름 정하기"
    }
    
    func setOtherUI() {
        underlineView.layer.borderWidth = 1
        underlineView.layer.borderColor = UIColor.primary241231.cgColor
        
        nicknameTextField.borderStyle = .none
    }

    @IBAction
    func returnKeyTapped(_ sender: UITextField) {
    }
    
    @IBAction
    func navRightBtnTapped(_ sender: UIBarButtonItem) {
        print(#function)
        guard let text = nicknameTextField.text else {
            print("text 에러")
            return
        }
        if text.count < 2 || text.count > 6 {
            let alert = TamagotchiUtil.showAlert(title: "실패", message: "2글자 이상 6글자 이하로 작성해주세요!")
            present(alert, animated: true)
        } else {
            navItem.title = "\(nicknameTextField.text ?? "")님 이름 정하기"
            UserDefaults.standard.set(text, forKey: "nickname")
            let alert = TamagotchiUtil.showAlert(title: "성공", message: "닉네임이 성공적으로 저장되었습니다!")
            present(alert, animated: true)
            
        }
        
    }
}


/**질문
 1. navleftButton.title = "설정" 코드로 좌상단 left아이템의 이름을 설정으로 바꿨으나, 함께 아래 코드로 '<' image를 넣으려는데 실패하였습니다.
 navleftButton.image = UIImage(systemName: "chevron.left")
 
 2.
 **/
