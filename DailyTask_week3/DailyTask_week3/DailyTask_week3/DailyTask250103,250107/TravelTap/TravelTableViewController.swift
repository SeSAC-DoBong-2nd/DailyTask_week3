//
//  TravelTableViewController.swift
//  DailyTask_week2
//
//  Created by 박신영 on 1/4/25.
//

import UIKit

import Kingfisher

class TravelTableViewController: UITableViewController {
    
    var travelList = TravelInfo().travel {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //평점 기준 별 개수 반환 함수
    func calculatorStar(grade: Double) -> String {
        let num = round(grade) //소수점 반올림
        switch num {
        case 1:
            return "⭐️"
        case 2:
            return "⭐️⭐️"
        case 3:
            return "⭐️⭐️⭐️"
        case 4:
            return "⭐️⭐️⭐️⭐️"
        case 5:
            return "⭐️⭐️⭐️⭐️⭐️"
        default:
            return "실패"
        }
    }
    
    @objc
    func heartButtonTapped(_ sender: UIButton) {
        print(#function, sender.tag)
        travelList[sender.tag].like?.toggle()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let isAd = travelList[indexPath.row].ad
        if isAd {
            return 110
        } else {
            return 140
        }
    }
    
    // MARK: - TableView 연관
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let travelCell = tableView.dequeueReusableCell(withIdentifier: TravelTableViewCell.identifier) as! TravelTableViewCell
        let adCell = tableView.dequeueReusableCell(withIdentifier: AdTableViewCell.identifier) as! AdTableViewCell
        let travelRow = travelList[indexPath.row]
        
        let isAd = travelRow.ad ? true : false
        let noSeparatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        
        switch isAd {
        case true:
            //adCell UI 함수
            adCell.setAdCellUI()
            
            //adCell일 경우 cell 하단 separator 표시 x
            adCell.separatorInset = noSeparatorInset
            return adCell
        case false:
            travelCell.heartButton.tag = indexPath.row
            travelCell.heartButton.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
            
            let image = travelRow.travel_image
            let titleText = travelRow.title
            let subtitleText = travelRow.description
            let grade = travelRow.grade // 평점
            let save = travelRow.save
            let likeImage = (travelRow.like ?? false) ? "heart.fill" : "heart"
            let starCnt = calculatorStar(grade: grade ?? 0.0)
            
            //travelCell UI 함수
            travelCell.setTravelCellUI(image: image, titleText: titleText, subtitleText: subtitleText, grade: grade, likeImage: likeImage, save: save, starCnt: starCnt)
            
            //현재 indexPath.row가 travelList index의 마지막 원소가 아니고,
            //현재 indexPath.row 이후 나올 cell이 adCell일 경우 cell 하단 separator 표시 x
            if indexPath.row != (travelList.count-1) && travelList[indexPath.row + 1].ad == true {
                travelCell.separatorInset = noSeparatorInset
            }
            return travelCell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let adCell = tableView.dequeueReusableCell(withIdentifier: AdTableViewCell.identifier) as! AdTableViewCell
        let travelRow = travelList[indexPath.row]
        let isAd = travelRow.ad ? true : false
        
        switch isAd {
        case true:
            //1. 뷰컨트롤러가 위치한 스토리보드 특정
            let sb = UIStoryboard(name: "DailyTask250103", bundle: nil)
            
            //2. 전환할 뷰컨트롤러 가져오기
            let vc = sb.instantiateViewController(withIdentifier: "AdViewController") as! AdViewController
            vc.adTitleText = adCell.randomTitleText
            
            let navVC = UINavigationController(rootViewController: vc)
            navVC.navigationBar.tintColor = .black
            navVC.modalPresentationStyle = .fullScreen
            navVC.modalTransitionStyle = .crossDissolve
            
            present(navVC, animated: true)
        case false:
            //1. 뷰컨트롤러가 위치한 스토리보드 특정
            let sb = UIStoryboard(name: "DailyTask250103", bundle: nil)
            
            //2. 전환할 뷰컨트롤러 가져오기
            let vc = sb.instantiateViewController(withIdentifier: "TouristPlaceViewController") as! TouristPlaceViewController
            vc.mainImage = travelRow.travel_image
            vc.titleText = travelRow.title
            vc.subtitleText = travelRow.description
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

/* 미완
 1. didSelectRowAt에서 ad에 따라 adCell을 반환 받아 구성중인데, 이 때 adCell 클릭했을 때 그 안의 text를 어떻게 추적할까
   - 현재 나는 adCell의 광고문구 값은 AdTableViewCell에서 직접 다루고 있어 방법이 없다.
 */
