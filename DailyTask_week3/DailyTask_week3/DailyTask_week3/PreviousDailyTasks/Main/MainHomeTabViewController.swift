//
//  MainHomeTabViewController.swift
//  1st-Task_MovieProject
//
//  Created by 박신영 on 12/27/24.
//

import UIKit

class MainHomeTabViewController: UIViewController {
    
    @IBOutlet var mainNavItem: UINavigationItem!
    @IBOutlet var newOneMark1: UILabel!
    
    @IBOutlet var newEpisodeMark1: UILabel!
    @IBOutlet var newEpisodeMark2: UILabel!
    
    @IBOutlet var nowWatchingMark1: UILabel!
    @IBOutlet var nowWatchingMark2: UILabel!
    
    @IBOutlet var top10Mark1: UIImageView!
    @IBOutlet var top10Mark2: UIImageView!
    @IBOutlet var top10Mark3: UIImageView!
    
    @IBOutlet var playBtn: UIButton!
    @IBOutlet var myBestListBtn: UIButton!
    
    @IBOutlet var bottomLabel: UILabel!
    
    @IBOutlet var mainPosterImageVIew: UIImageView!
    @IBOutlet var firstBottomImageView: UIImageView!
    @IBOutlet var secondBottomImageView: UIImageView!
    @IBOutlet var thirdBottomImageVIew: UIImageView!
    
    @IBOutlet var top10BadgeImage3: UIImageView!
    @IBOutlet var top10BadgeImage2: UIImageView!
    @IBOutlet var top10BadgeImage1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainNavItem.title = "psy님"
        
        posterSetUI()
        buttonSetUI()
        labelSetUI()
        bottomImageMarkSetUI()
        
        playBtnAction(playBtn)
    }
    
    func bottomImageMarkSetUI() {
        newOneMark1.text = "새로운 시리즈"
        newOneMark1.textColor = .white
        newOneMark1.backgroundColor = .red
        newOneMark1.font = UIFont.systemFont(ofSize: 9)
        newOneMark1.textAlignment = .center
        
        [newEpisodeMark1, newEpisodeMark2].forEach({ i in
            i.text = "새로운 에피소드"
            i.textColor = .white
            i.backgroundColor = .red
            i.font = UIFont.systemFont(ofSize: 8)
            i.textAlignment = .center
        })
        
        [nowWatchingMark1, nowWatchingMark2].forEach({ i in
            i.text = "지금 시청하기"
            i.textColor = .black
            i.backgroundColor = .white
            i.font = UIFont.systemFont(ofSize: 10)
            i.textAlignment = .center
        })
        
        [newOneMark1, newEpisodeMark1, newEpisodeMark2, nowWatchingMark1, nowWatchingMark2].forEach({ i in
            i?.clipsToBounds = true
            i?.layer.cornerRadius = 4
        })
        
        top10BadgeImage1.image = .top10Badge
        top10BadgeImage2.image = .top10Badge
        top10BadgeImage3.image = .top10Badge
    }
    
    func posterSetUI() {
        [mainPosterImageVIew, firstBottomImageView, secondBottomImageView, thirdBottomImageVIew].forEach({ i in
            i?.layer.cornerRadius = 16
            i?.layer.borderWidth = 3
        })
        mainPosterImageVIew.layer.borderColor = UIColor.red.cgColor
        firstBottomImageView.layer.borderColor = UIColor.green.cgColor
        secondBottomImageView.layer.borderColor = UIColor.yellow.cgColor
        thirdBottomImageVIew.layer.borderColor = UIColor.blue.cgColor
    }
    
    func buttonSetUI() {
        playBtn.setTitle("재생", for: .normal)
        playBtn.setImage(.play, for: .normal)
        playBtn.tintColor = .white
        playBtn.titleLabel?.textColor = .black
        
        myBestListBtn.setTitle("내가 찜한 리스트", for: .normal)
        myBestListBtn.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        myBestListBtn.setImage(UIImage(systemName: "plus"), for: .normal)
        myBestListBtn.tintColor = .lightGray
        myBestListBtn.layer.opacity = 0.8
    }
    
    func labelSetUI() {
        bottomLabel.text = "지금 뜨는 콘텐츠"
        bottomLabel.textColor = .white
    }
    
    @IBAction func playBtnAction(_ sender: UIButton) {
        let moviewPosterArr = [UIImage(resource: .범죄도시3), UIImage(resource: .밀수), UIImage(resource: .서울의봄), UIImage(resource: ._1), UIImage(resource: ._2), UIImage(resource: ._3), UIImage(resource: ._4), UIImage(resource: ._5)]
        [mainPosterImageVIew, firstBottomImageView, secondBottomImageView, thirdBottomImageVIew].forEach({ i in
            i?.image = moviewPosterArr.randomElement()
        })
        
        let flagArr = [true, false]
        
        [newOneMark1, newEpisodeMark1, newEpisodeMark2, top10Mark1, top10Mark2, top10Mark3, nowWatchingMark1, nowWatchingMark2].forEach({i in
            i?.isHidden = flagArr.randomElement() ?? true
        })
    }
    
}
