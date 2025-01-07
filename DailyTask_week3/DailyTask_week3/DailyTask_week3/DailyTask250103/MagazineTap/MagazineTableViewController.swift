//
//  MagazineTableViewController.swift
//  DailyTask_week2
//
//  Created by 박신영 on 1/4/25.
//

import UIKit

import Kingfisher
import SafariServices

class MagazineTableViewController: UITableViewController {
    
    var magazineList = MagazineInfo().magazine
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //cell 높이 설정
        tableView.rowHeight = 470
    }
    
    //[yyMMdd] -> [yy년 MM월 dd일] 형식 변환
    func convertMagazineDate(date: String) -> String {
        //yyMMdd 형식 DateFormatter 변수 inputDate 생성
        let inputDate = DateFormatter()
        inputDate.dateFormat = "yyMMdd"
        
        //inputDate를 Date 타입으로 변환하여 date에 대입
        guard let date = inputDate.date(from: date) else {
            print("convertMagazineDate 속 date 변환 실패")
            return ""
        }
        
        //yyMMdd 형식 DateFormatter 변수 outputDate 생성
        //위에서 Date 타입으로 바꾼 date, outputDate string에 대입하여 반환
        let outputDate = DateFormatter()
        outputDate.dateFormat = "yy년 MM월 dd일"
        return outputDate.string(from: date)
    }
    
    
    // MARK: - TableView 관련
    
    //cell 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let magazineCell = tableView.dequeueReusableCell(withIdentifier: MagazineTableViewCell.identifier) as! MagazineTableViewCell
        let magazineRow = magazineList[indexPath.row]
        
        let posterImage = magazineRow.photo_image
        let title = magazineRow.title
        let subtitle = magazineRow.subtitle
        let date = magazineRow.date
        
        let convertDate = convertMagazineDate(date: date)
        
        magazineCell.setMagazineCellUI(image: posterImage, title: title, subtitle: subtitle, date: convertDate)
        
        return magazineCell
    }
    
    //cell 클릭 시
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let link = magazineList[indexPath.row].link
        // URL(string: ) type이 String? 이기에 옵셔널 제거
        guard let url = URL(string: link) else { return }
        
        //웹 링크로 연결해야 하기에 SFSafariViewController 사용
        let safariVC = SFSafariViewController(url: url)
        //safariVC modal style 설정
        safariVC.modalPresentationStyle = .pageSheet
        //화면 이동
        present(safariVC, animated: true, completion: nil)
        
        //model이 닫히고 화면이 돌아왔을 때 tableView focus된 배경색 제거
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
