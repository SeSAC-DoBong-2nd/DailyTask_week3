//
//  DailyTask2ndViewController.swift
//  1st-Task_MovieProject
//
//  Created by 박신영 on 12/26/24.
//

import UIKit

class AutoLayoutNetfilxViewController: UIViewController {

    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var firstTextField: UITextField!
    @IBOutlet var secondTextField: UITextField!
    @IBOutlet var thirdTextField: UITextField!
    @IBOutlet var fourthTextField: UITextField!
    @IBOutlet var fifthTextField: UITextField!
    
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var moreInfoLabel: UILabel!
    @IBOutlet var switchBtn: UISwitch!
    
    @IBOutlet var bottomContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        registerButton.setTitle("케케몬", for: .normal)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.setTitle("회원가입", for: .highlighted)
        registerButton.setTitleColor(.black, for: .highlighted)
        registerButton.tintColor = .white
        registerButton.layer.cornerRadius = 16
        
        moreInfoLabel.text = "추가 정보 입력"
        moreInfoLabel.textColor = .white
        moreInfoLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        switchBtn.setOn(true, animated: true)
        switchBtn.onTintColor = .brown
        switchBtn.thumbTintColor = .blue
    }
    
    func setUI() {
        view.backgroundColor = .black
        mainImageView.image = UIImage(resource: .wordmark)
        
        let textFieldList = [firstTextField, secondTextField, thirdTextField, fourthTextField, fifthTextField]
        let textFieldPlaceholderTextList = ["이메일 주소 또는 전화번호", "비밀번호", "닉네임", "위치", "추천 코드 입력"]
        
        for i in 0..<textFieldList.count {
            if textFieldList[i] == secondTextField {
                setTextFieldUI(textField: textFieldList[i] ?? UITextField(), phText: textFieldPlaceholderTextList[i], isSecureTextEntry: true)
            } else {
                setTextFieldUI(textField: textFieldList[i] ?? UITextField(), phText: textFieldPlaceholderTextList[i])
            }
        }
        
        bottomContainer.backgroundColor = .clear
    }
    
    func setTextFieldUI(textField: UITextField, phText placeholderText: String, isSecureTextEntry: Bool = false) {
        textField.textColor = .white
        textField.backgroundColor = .lightGray
        textField.layer.cornerRadius = 12
        textField.textAlignment = .center
        textField.keyboardType = .default
        textField.borderStyle = .none
        textField.placeholder = placeholderText
        textField.isSecureTextEntry = isSecureTextEntry
    }
    
    
    @IBAction func textFieldKeyboardDismiss1(_ sender: UITextField) {
    }
    
    @IBAction
    func didTapRegisterBtn(_ sender: UIButton) {
        view.endEditing(true)
    }
    
}

/// 5개의 textField에 아래와 같은 함수의 거터를 연결시켜 return 키로 동작시키려 하였으나 제일 처음 우클릭 드래그로 액션을 만든 firstTextField만 동작하였습니다.
/// 그래서 위와 같이 5개의 액션을 생성하는 코드로 진행하였습니다.
//@IBAction func textFieldKeyboardDismiss(_ sender: UITextField) {
//    print("케케몬")
//    view.endEditing(true)
//}
