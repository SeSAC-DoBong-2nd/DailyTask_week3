//
//  Case2TableViewController.swift
//  DailyTask_week2
//
//  Created by 박신영 on 1/3/25.
//

import UIKit

class Case2TableViewController: UITableViewController {
    
    let sectionHeader = ["전체 설정", "개인 설정", "기타"]
    let sectionFirstlist = ["공지사항", "실험실", "버전 정보"]
    let sectionSecondlist = ["개인/보안", "알림", "채팅", "멀티프로필"]
    let sectionThirdlist = ["고객센터/도움말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        switch section {
        case 0:
            return sectionFirstlist.count
        case 1:
            return sectionSecondlist.count
        case 2:
            return sectionThirdlist.count
        default:
            return 0
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeader[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "psyCell")!
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = sectionFirstlist[indexPath.row]
        case 1:
            cell.textLabel?.text = sectionSecondlist[indexPath.row]
        case 2:
            cell.textLabel?.text = sectionThirdlist[indexPath.row]
        default:
            cell.textLabel?.text = "Error"
        }
        
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12, weight: .light)
        cell.backgroundColor = .black
        
        return cell
    }
    
}

/** 추후 알아볼 것
 1. 섹션 헤더 title의 색상과 폰트 설정은 어떻게 하는지
 **/
