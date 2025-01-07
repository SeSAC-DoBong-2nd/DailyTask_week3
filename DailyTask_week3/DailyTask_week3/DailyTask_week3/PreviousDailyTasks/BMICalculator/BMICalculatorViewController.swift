//
//  BMICalculatorViewController.swift
//  DailyTask_week2
//
//  Created by 박신영 on 12/30/24.
//

import UIKit

class BMICalculatorViewController: UIViewController {
    
    @IBOutlet var nicknameLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var mainImage: UIImageView!
    
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var heightContainer: UIView!
    @IBOutlet var heightTextField: UITextField!
    
    @IBOutlet var weightContainer: UIView!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var weightTextField: UITextField!
    
    @IBOutlet var securityButton: UIButton!
    @IBOutlet var randomBMIButton: UIButton!
    
    @IBOutlet var resultButton: UIButton!
    
    var securityMode = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    func setUI() {
        mainImage.image = .image
        mainImage.contentMode = .scaleAspectFill
        
        setButtonUI()
        
        let labelArr = [titleLabel, subtitleLabel, nicknameLabel, heightLabel, weightLabel]
        let labelTextArr = ["BMI Calculator", "당신의 BMI 지수를 알려드릴게요.", "psy", "키가 어떻게 되시나요?", "몸무게는 어떻게 되시나요?"]
        
        for i in 0..<labelArr.count {
            if i == 0 {
                setLabelUI(label: labelArr[i] ?? UILabel(), fontSize: 26, fontWeight: .heavy, text: labelTextArr[i])
            } else if i == 1 {
                setLabelUI(label: labelArr[i] ?? UILabel(), fontSize: 18, text: labelTextArr[i], numberOfLines: 2)
            } else {
                setLabelUI(label: labelArr[i] ?? UILabel(), fontSize: 16, text: labelTextArr[i])
            }
        }
        for i in [heightContainer, weightContainer] {
            setContainerUI(view: i ?? UIView())
        }
        
        [heightTextField, weightTextField].forEach { textField in
            textField?.borderStyle = .none
            textField?.keyboardType = .numberPad // 숫자 키패드로 설정
        }
        heightTextField.placeholder = "cm 단위로, 소수점을 제외하고 입력해주세요"
        weightTextField.placeholder = "kg 단위로, 소수점을 제외하고 입력해주세요"
        weightTextField.isSecureTextEntry = securityMode
        
        setUserDefaults()
    }
    
    func setLabelUI(label: UILabel, fontSize: Double, fontWeight: UIFont.Weight = .semibold, text: String, numberOfLines: Int = 1) {
        label.text = text
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        label.textAlignment = .left
        label.numberOfLines = numberOfLines
    }
    
    func setContainerUI(view: UIView) {
        view.layer.borderWidth = 2.5
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layer.cornerRadius = 20
    }
    
    func setButtonUI() {
        securityButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        securityButton.tintColor = .lightGray
        
        randomBMIButton.setTitle("랜덤으로 BMI 계산하기", for: .normal)
        randomBMIButton.setTitleColor(.red, for: .normal)
        
        resultButton.setTitle("결과 확인", for: .normal)
        resultButton.backgroundColor = .purple
        resultButton.tintColor = .white
        resultButton.layer.cornerRadius = 20
    }
    
    func setUserDefaults() {
        let nickname = UserDefaults.standard.string(forKey: "nickname")
        let height = UserDefaults.standard.string(forKey: "height")
        let weight = UserDefaults.standard.string(forKey: "weight")
        if nickname == "" || nickname == nil {
            nicknameLabel.text = "psy"
        } else {
            nicknameLabel.text = nickname
        }
        heightTextField.text = height
        weightTextField.text = weight
    }
    
    func calculateBMI(heightInCm: Double, weight: Double) -> Double {
        let heightInMeters = heightInCm / 100.0
        
        guard heightInMeters > 0 else {
            print("키는 0보다 커야 합니다.")
            return 0.0
        }
        
        // BMI 계산
        let bmi = weight / (heightInMeters * heightInMeters)
        return bmi
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
    
    @IBAction
    func textFieldEditingChanged(_ sender: UITextField) {
        guard let text = sender.text else { return }
        
        //숫자인지 고차함수 filter 활용하여 검열
        let filteredText = text.filter { $0.isNumber }
        
        if text != filteredText {
            sender.text = filteredText
        }
    }
    
    @IBAction
    func textFieldKeyboardDismiss(_ sender: UITextField) {
    }
    
    @IBAction
    func keyboardDismiss(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction
    func resultButtonTapped(_ sender: UIButton) {
        //공백 제거 whitespaces
        guard let heightText = heightTextField.text?.trimmingCharacters(in: .whitespaces),
              let weightText = weightTextField.text?.trimmingCharacters(in: .whitespaces),
              !heightText.isEmpty, !weightText.isEmpty,
              let height = Double(heightText), let weight = Double(weightText) else {
            showAlert(title: "입력 오류", message: "키와 몸무게를 올바르게 입력해주세요.")
            return
        }
        
        // 범위 검증 contains
        guard (50...250).contains(height), (10...300).contains(weight) else {
            showAlert(title: "입력 오류", message: "키는 50~250cm, 몸무게는 10~300kg 사이로 입력해주세요.")
            return
        }
        
        // BMI 계산
        let result = calculateBMI(heightInCm: height, weight: weight)
        showAlert(title: "BMI 결과", message: "BMI: \(String(format: "%.2f", result))") //%.2f 활용하여 소수점 2자리 다루기
    }
    
    @IBAction
    func securityButtonTapped(_ sender: UIButton) {
        securityMode.toggle()
        weightTextField.isSecureTextEntry = securityMode ? true : false
        securityMode ? securityButton.setImage(UIImage(systemName: "eye.slash"), for: .normal) :
        securityButton.setImage(UIImage(systemName: "eye"), for: .normal)
        
        securityButton.tintColor = securityMode ?
            .lightGray :
            .black
    }
    
    @IBAction
    func saveButtonTapped(_ sender: UIButton) {
        UserDefaults.standard.set(nicknameLabel.text, forKey: "nickname")
        UserDefaults.standard.set(heightTextField.text, forKey: "height")
        UserDefaults.standard.set(weightTextField.text, forKey: "weight")
        showAlert(
            title: "저장되었습니다",
            message:
                """
nickname : \(UserDefaults.standard.string(forKey: "nickname") ?? "")
height : \(UserDefaults.standard.string(forKey: "height") ?? "")
weight : \(UserDefaults.standard.string(forKey: "weight") ?? "")
"""
        )
    }
    
    @IBAction
    func resetButtonTapped(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "nickname")
        UserDefaults.standard.removeObject(forKey: "height")
        UserDefaults.standard.removeObject(forKey: "weight")
        nicknameLabel.text = ""
        heightTextField.text = ""
        weightTextField.text = ""
    }
    
    @IBAction
    func randomButtonTapped(_ sender: UIButton) {
        let height = String((50...250).randomElement() ?? 0)
        let weight = String((10...300).randomElement() ?? 0)
        heightTextField.text = height
        weightTextField.text = weight
    }
    
}
