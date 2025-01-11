//
//  GameWaitingViewController.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/9/25.
//

import UIKit

import SnapKit

class GameWaitingViewController: UIViewController {
    
    var mainImageArr = [
        UIImage(resource: .emotion1),
        UIImage(resource: .emotion2),
        UIImage(resource: .emotion3),
        UIImage(resource: .emotion4),
        UIImage(resource: .emotion5)
    ]
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var numTextField: UITextField!
    @IBOutlet var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = ._250109Background
        setRegister()
        setUI()
        setLayout()
    }
    
    override func viewDidLayoutSubviews() {
        print(#function)
        numTextField.setTextFieldUnderline(color: .white)
    }
    
    func setRegister() {
        numTextField.delegate = self
    }
    
    func setUI() {
        mainImageView.image = mainImageArr.randomElement()
        mainImageView.contentMode = .scaleAspectFill
        
        titleLabel.setLabelUI("UP DOWN",
                              font: .boldSystemFont(ofSize: 40),
                              alignment: .center)
        
        subtitleLabel.setLabelUI("GAME",
                                 font: .systemFont(ofSize: 20,weight: .regular),
                                 alignment: .center)
        
        numTextField.setTextField(font: .boldSystemFont(ofSize: 20),
                                  placeholder: "숫자를 입력해주세요",
                                  textAlignment: .center,
                                  backgroundColor: .clear)
        
        startButton.setButtonUIWithTitle(title: "시작하기",
                                         titleColor: .white,
                                         backgroundColor: .black,
                                         cornerRadius: 0)
    }
    
    func setLayout() {
        view.keyboardLayoutGuide.topAnchor.constraint(equalTo: startButton.bottomAnchor).isActive = true
    }
    
    @IBAction
    func dismissKeyboard(_ sender: UITextField) {
    }
    
    @IBAction
    func startButtonTapped(_ sender: UIButton) {
        print(#function)
        
        let sb = UIStoryboard(name: "UpDownGame", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "UpDownGameViewController") as! UpDownGameViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .automatic
        vc.scope = Int(numTextField.text ?? "")
        present(vc, animated: true)
    }
    
}

//MARK: - UITextFieldDelegate
extension GameWaitingViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else {
            print("textFieldDidChangeSelection guard let Error")
            return
        }
        
        //숫자인지 고차함수 filter 활용하여 검열
        let filteredText = text.filter { $0.isNumber }
        
        if text != filteredText {
            textField.text = filteredText
        }
    }
    
}

/**
 1. IB는 키보드 레이아웃 가이드가 안 먹는가..?!
   - snapkit까지 동원하였으나 실패..
   - storyBoard startButton bottom 제약 조건 삭제하고, 69번 line 코드 실행하니 성공!
     - snapkit 관련 코드 사용하지 않는 방법을 재수정!
 */
