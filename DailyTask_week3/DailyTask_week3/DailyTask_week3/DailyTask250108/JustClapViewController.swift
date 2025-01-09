//
//  JustClapViewController.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/8/25.
//

import UIKit

class JustClapViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var numTextField: UITextField!
    @IBOutlet var clapTextView: UITextView!
    @IBOutlet var resultLabel: UILabel!
    
    let pickerView = UIPickerView()
    var justClapList = (1...100).map({String($0)})
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setRegister()
        setUI()
    }
    
    func setUI() {
        titleLabel.setLabelUI("369 게임", font: .boldSystemFont(ofSize: 40), alignment: .center)
        
        resultLabel.setLabelUI("숫자를 선택해주세요!",
                               font: .boldSystemFont(ofSize: 35),
                               alignment: .center,
                               numberOfLines: 0)
        
        clapTextView.font = .systemFont(ofSize: 20, weight: .regular)
        clapTextView.textColor = .lightGray
        clapTextView.textAlignment = .center
        clapTextView.text = "숫자를 선택해주세요!"
        
        numTextField.inputView = pickerView
        numTextField.placeholder = "최대 숫자를 입력해주세요"
        numTextField.font = .boldSystemFont(ofSize: 25)
        numTextField.layer.borderColor = UIColor.lightGray.cgColor
        numTextField.layer.borderWidth = 2
        numTextField.textAlignment = .center
    }
    
    func setRegister() {
        pickerView.delegate = self
        pickerView.dataSource = self
        
        numTextField.delegate = self
        
        clapTextView.delegate = self
    }

}

private extension JustClapViewController {
    
    func returnClapTextViewText(num: Int) -> [String] {
        let scope = (1...num).map({String($0)})
        
        // 정규식 코드 활용
        let str = scope.map { $0.replacingOccurrences(of: "[369]", with: "👏", options: .regularExpression) }
        
        return str
    }
    
    func returnResultLabelText(str: String) -> Int {
        let mapStr = str.map { $0 }
        let clapArr = mapStr.filter { $0 == "👏" }
        return clapArr.count
    }
    
}

extension JustClapViewController: UITextFieldDelegate {
    //textFiled를 키보드로 입력할 때에는 실시간 textField text 변화를 잘 감지하던 textFieldDidChangeSelection 함수가 pickerView delegate로 값이 바뀌었을 때는 처음 값이 바뀌었을 때 밖에 동작하지 않아 아래 함수로 대체 하였습니다.
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        guard let text = textField.text else {
            return
        }
        print(text)
        clapTextView.text =  returnClapTextViewText(num: Int(text) ?? 0).joined(separator: ",")
        
        let totalClapCount = returnResultLabelText(str: clapTextView.text)
        resultLabel.text = "숫자 \(text)까지 총 박수는 \(totalClapCount)번 입니다."
    }
    
}

extension JustClapViewController: UITextViewDelegate {
    
    //textView 비활성화
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        print(#function)
        return false
    }
    
}

extension JustClapViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let reverse = justClapList.reversed() as [String]
        numTextField.text = reverse[row]
        view.endEditing(true)
        return
    }
    
}

extension JustClapViewController: UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return justClapList.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let reverse = justClapList.reversed() as [String]
        return reverse[row]
    }
    
}

//실시간 textField text 변화 감지 (왜 한번 밖에 안 뜰까?)
//    func textFieldDidChangeSelection(_ textField: UITextField) {
//        guard let text = textField.text else {
//            return
//        }
//        print(text)
//        clapTextView.text =  returnClapTextViewText(num: Int(text) ?? 0).joined(separator: ",")
//
//        let totalClapCount = returnResultLabelText(str: clapTextView.text)
//        resultLabel.text = "숫자 \(text)까지 총 박수는 \(totalClapCount)번 입니다."
//    }
