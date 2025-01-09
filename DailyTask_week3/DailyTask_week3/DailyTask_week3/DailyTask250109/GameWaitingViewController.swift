//
//  GameWaitingViewController.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/9/25.
//

import UIKit

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
        
        titleLabel.setLabelUI("UP DOWN", font: .boldSystemFont(ofSize: 40), alignment: .center)
        subtitleLabel.setLabelUI("GAME", font: .systemFont(ofSize: 20, weight: .regular), alignment: .center)
        
        numTextField.setTextField(font: .boldSystemFont(ofSize: 20),
                                  placeholder: "숫자를 입력해주세요",
                                  textAlignment: .center,
                                  backgroundColor: .clear)
        
        startButton.setButtonUIWithTitle(title: "시작하기",
                                         titleColor: .white,
                                         backgroundColor: .black,
                                         cornerRadius: 0)
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

extension GameWaitingViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        //keyboardLayoutGuide 사용
        //사용시 아래 1번 상황 발생
//        view.keyboardLayoutGuideUse(view: numTextField)
    }
    
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
 1. textField 키보드 올라갔다 내려오면 startButton UI가 풀림과 동시에 버튼 동작 안 함
 */
