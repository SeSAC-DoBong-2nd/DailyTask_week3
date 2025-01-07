//
//  AutoLayoutViewController.swift
//  DailyTask_week2
//
//  Created by 박신영 on 1/2/25.
//

import UIKit

class AutoLayoutNaverViewController: UIViewController {
    
    @IBOutlet var topContainer: UIView!
    @IBOutlet var membershipButton: UIButton!
    @IBOutlet var paymentButton: UIButton!
    @IBOutlet var couponButton: UIButton!
    
    @IBOutlet var payContainer: UIView!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var nPayLabel: UILabel!
    @IBOutlet var placeLabel: UILabel!
    @IBOutlet var payImage: UIImageView!
    @IBOutlet var payCommentLabel: UILabel!
    
    @IBOutlet var bottomContainer: UIView!
    @IBOutlet var checkImage: UIImageView!
    @IBOutlet var bottomLabel: UILabel!
    @IBOutlet var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setTopButtonUI()
        setPayUI()
        setTappedButtonUI(paymentButton)
    }
    
    func setTopButtonUI() {
        topContainer.backgroundColor = .clear
        membershipButton.setTitle("멤버십", for: .normal)
        couponButton.setTitle("쿠폰", for: .normal)
        paymentButton.setTitle("현장결제", for: .normal)
    }
    
    func setPayUI() {
        payContainer.backgroundColor = .white
        payContainer.layer.cornerRadius = 16
        
        cancelButton.setImage(UIImage(systemName: "x.circle"), for: .normal)
        cancelButton.contentMode = .scaleAspectFill
        cancelButton.backgroundColor = .clear
        cancelButton.tintColor = .black
        cancelButton.setTitle("", for: .normal)
        
        nPayLabel.text = "N Pay"
        nPayLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        placeLabel.text = "국내 ▼"
        placeLabel.textColor = .lightGray
        placeLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        payImage.image = ._4
        payImage.contentMode = .scaleAspectFill
        
        payCommentLabel.textAlignment = .center
        payCommentLabel.numberOfLines = 2
        payCommentLabel.text = "한번만 인증하고\n비밀번호 없이 결제하세요"
        payCommentLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        bottomContainer.backgroundColor = .clear
        checkImage.image = UIImage(systemName: "checkmark")
        checkImage.contentMode = .scaleAspectFit
        bottomLabel.text = "바로결제 사용하기"
        bottomLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        doneButton.setTitle("확인", for: .normal)
        doneButton.setTitleColor(.white, for: .normal)
        doneButton.backgroundColor = .green.withAlphaComponent(0.8)
        doneButton.layer.cornerRadius = 30
    }
    
    @IBAction
    func setTappedButtonUI(_ sender: UIButton) {
        for i in [membershipButton, couponButton, paymentButton] {
            if i == sender {
                i?.setTitleColor(.white, for: .normal)
                i?.backgroundColor = .darkGray
                i?.layer.cornerRadius = 16
            } else {
                i?.setTitleColor(.white.withAlphaComponent(0.4), for: .normal)
                i?.backgroundColor = .clear
                i?.layer.cornerRadius = 0
            }
        }
    }
    

}
