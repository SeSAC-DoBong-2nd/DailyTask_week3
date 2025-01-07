//
//  TopCitiesViewController.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/7/25.
//

import UIKit

class TopCitiesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setNav()
    }
    
    func setNav() {
        let rightBtn = UIBarButtonItem(title: "도시 상세 정보", style: .plain, target: self, action: #selector(rightNavButtonTapped))
        navigationItem.rightBarButtonItem = rightBtn
    }
    
    @objc
    func rightNavButtonTapped() {
        //1. 뷰컨트롤러가 위치한 스토리보드 특정
        let sb = UIStoryboard(name: "DailyTask250103", bundle: nil)
        
        //2. 전환할 뷰컨트롤러 가져오기
        let travelVC = sb.instantiateViewController(withIdentifier: "TravelTableViewController") as! TravelTableViewController
        
        //3. 화면을 전환할 방법 선택하기 - push(오른쪽에서 왼쪽으로)
        navigationController?.pushViewController(travelVC, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
