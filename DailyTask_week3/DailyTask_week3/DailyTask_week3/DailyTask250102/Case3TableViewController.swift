//
//  Case3TableViewController.swift
//  DailyTask_week2
//
//  Created by 박신영 on 1/3/25.
//

import UIKit

class Case3TableViewController: UITableViewController {
    
    var shoppingList = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    @IBOutlet var headerButton2: UIButton!
    
    @IBOutlet var headerView: UIView!
    @IBOutlet var headerTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHeaderUI()
        tableView.rowHeight = 40
    }
    
    func setHeaderUI() {
        headerView.backgroundColor = .primary
        
        headerTextField.placeholder = "무엇을 구매하실 건가요?"
        headerTextField.borderStyle = .none
        
        headerButton2.setTitle("추가", for: .normal)
        headerButton2.backgroundColor = .second
        headerButton2.layer.cornerRadius = 10
        headerButton2.setTitleColor(.black, for: .normal)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell")!
        
        cell.textLabel?.setPrimaryLabel(shoppingList[indexPath.row])
        
        cell.imageView?.image = UIImage(systemName: "checkmark.square")
        cell.backgroundColor = .primary
        cell.tintColor = .black
        cell.accessoryView = .some(UIImageView(image: UIImage(systemName: "star")))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function, indexPath.row)
//        guard let currentImage = cell.imageView?.image else {
//            print("Error currentImage")
//            return
//        }
//        indexPath.row.image
//        cell.imageView?.image = UIImage(systemName: "checkmark.square")
//        cell.accessoryView = .some(UIImageView(image: UIImage(systemName: "star")))
        
        tableView.reloadData()
    }
    
    func addShoppingList() {
        guard let text = headerTextField.text else {
            print("addShoppingList Error")
            return
        }
        if text.count != 0 {
            shoppingList.append(text)
        }
    }
    
    @IBAction func addShoppingListButtonTapped(_ sender: UIButton) {
        sender.isEnabled = false //중복 클릭 방지
        
        //버튼 눌렀을 때 cell에 새로운 값들 추가 시키기
        addShoppingList()
        
        tableView.reloadData()
        
        sender.isEnabled = true //중복 클릭 방지 해제
    }
    
}

/**알아봐야할것
 1. 스토리보드 속 헤더뷰 양사이드 인셋은 어떻게 줄까.
    - 이거 섹션이구나
 2. 이거 cell image랑 악세사리 뷰 이미지에 각 버튼을 어떻게 달아줄까
 **/
