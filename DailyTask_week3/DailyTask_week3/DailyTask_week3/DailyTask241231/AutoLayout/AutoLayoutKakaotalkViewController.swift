//
//  AutoLayoutKakaotalkViewController.swift
//  DailyTask_week2
//
//  Created by 박신영 on 1/2/25.
//

import UIKit

class AutoLayoutKakaotalkViewController: UIViewController {

    @IBOutlet var topContainer: UIView!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var giftButton: UIButton!
    @IBOutlet var textButton: UIButton!
    @IBOutlet var settingButton: UIButton!
    
    @IBOutlet var profileContainer: UIView!
    
    
    
    @IBOutlet var profileCommentLabel: UILabel!
    
    @IBOutlet var nicknameLabel: UILabel!
    
    
    @IBOutlet var profileImage: UIImageView!
    
    
    
    
    
    @IBOutlet var bottomContainer: UIView!
    @IBOutlet var chatWithMeContainer: UIView!
    @IBOutlet var editProfileContainer: UIView!
    @IBOutlet var kakaoStoryContainer: UIView!
    
    @IBOutlet var chatWithMeImage: UIImageView!
    @IBOutlet var editProfileImage: UIImageView!
    @IBOutlet var kakaoStoryImage: UIImageView!
    
    @IBOutlet var chatWithMeLabel: UILabel!
    @IBOutlet var editProfileLabel: UILabel!
    @IBOutlet var kakaoStoryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setTopUI()
        setProfileUI()
        setBottomUI()
    }
    
    
    func setTopUI() {
        topContainer.backgroundColor = .clear
        
        [cancelButton, giftButton, textButton, settingButton].forEach {i in
            i?.tintColor = .white
            i?.setTitle("", for: .normal)
            i?.contentMode = .scaleAspectFill
        }
        cancelButton.setImage(UIImage(systemName: "x.circle"), for: .normal)
        giftButton.setImage(UIImage(systemName: "gift.circle"), for: .normal)
        textButton.setImage(UIImage(systemName: "text.viewfinder"), for: .normal)
        settingButton.setImage(UIImage(systemName: "gearshape.circle"), for: .normal)
        
    }
    
    func setProfileUI() {
        profileContainer.backgroundColor = .clear
        
        profileCommentLabel.text = "오늘 하루도 화이탕!"
        profileCommentLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        nicknameLabel.text = "psy"
        nicknameLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        [profileCommentLabel, nicknameLabel].forEach { i in
            i?.textColor = .white
            i?.textAlignment = .center
        }
        
        profileImage.contentMode = .scaleAspectFill
        profileImage.image = ._1
        profileImage.layer.cornerRadius = 40
    }
    
    func setBottomUI() {
        [bottomContainer, chatWithMeContainer, editProfileContainer, kakaoStoryContainer].forEach {i in
            i?.backgroundColor = .clear
        }
        
        let image = [UIImage(systemName: "message.fill"), UIImage(systemName: "pencil"), UIImage(systemName: "paragraphsign")]
        let imageProperty = [chatWithMeImage, editProfileImage, kakaoStoryImage]
        for i in 0..<imageProperty.count {
            imageProperty[i]?.image = image[i]
            imageProperty[i]?.contentMode = .scaleAspectFit
            imageProperty[i]?.tintColor = .white
        }
        
        let labelText = ["나와의 채팅", "프로필 편집", "카카오스토리"]
        let labelProperty = [chatWithMeLabel, editProfileLabel, kakaoStoryLabel]
        for i in 0..<labelProperty.count {
            labelProperty[i]?.text = labelText[i]
            labelProperty[i]?.textColor = .white
            labelProperty[i]?.font = UIFont.systemFont(ofSize: 10, weight: .medium)
            labelProperty[i]?.textAlignment = .center
        }
    }
    
    
    @IBAction
    func chatWithMeButtonTapped(_ sender: UITapGestureRecognizer) {
        print(#function)
    }
    
    @IBAction
    func editProfileButtonTapped(_ sender: UITapGestureRecognizer) {
        print(#function)
    }
    
    @IBAction
    func kakaoStoryButtonTapped(_ sender: UITapGestureRecognizer) {
        print(#function)
    }
    
}

/** 질문
 1. 스토리보드에서 iamgeView의 layout을 줄 때에 safearea를 무시하는 방법이 있을까요? autolayout의 기준을 superView로 잡아도 잘 인식이 되지 않았습니다.
 */
