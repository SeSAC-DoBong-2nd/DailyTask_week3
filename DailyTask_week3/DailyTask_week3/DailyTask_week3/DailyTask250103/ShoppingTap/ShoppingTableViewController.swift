//
//  ShoppingTableViewController.swift
//  DailyTask_week2
//
//  Created by 박신영 on 1/3/25.
//

import UIKit

class ShoppingTableViewController: UITableViewController {
    
    var shoppingList: [ShoppingToDoModel] = shoppingToDoDummy {
        didSet {
            tableView.reloadData()
        }
    }
    
    //현재 textField에 입력된 글자를 저장 받을 변수
    var currentTextFieldText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    
    @objc
    func addButtonTapped(_ sender: UIButton) {
        shoppingList.append(
            ShoppingToDoModel(isChecked: false,
                              shoppingToDo: currentTextFieldText,
                              isStared: false)
        )
    }
    
    @objc
    func checkButtonTapped(_ sender: UIButton) {
        print(#function, sender.tag)
        shoppingList[sender.tag].isChecked.toggle()
    }
    
    @objc
    func starButtonTapped(_ sender: UIButton) {
        print(#function, sender.tag)
        shoppingList[sender.tag].isStared.toggle()
    }
    
    
    //MARK: - TableView 관련 함수
    
    //section 개수 설정
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //섹션 1과 섹션 2 사이 여백을 위해 footerHeight 설정
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
    
    //cell 높이 설정
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 70
        } else {
            return 50
        }
    }
    
    //cell 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return shoppingList.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: ShoppingTableViewHeaderCell.identifier) as! ShoppingTableViewHeaderCell
        headerCell.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        let shoppingRow = shoppingList[indexPath.row]
        
        let mainCell = tableView.dequeueReusableCell(withIdentifier: ShoppingTableViewCell.identifier) as! ShoppingTableViewCell
        let checkStateImage = shoppingRow.isChecked ?
            "checkmark.square.fill" : "checkmark.square"
        let starStateImage = shoppingRow.isStared ?
            "star.fill" : "star"
        mainCell.setShoppingMainCell(shoppingLabelText: shoppingRow.shoppingToDo, checkImage: checkStateImage, starImage: starStateImage)
        
        //section별 다른 Cell을 return 하고자 switch 사용
        switch indexPath.section {
        case 0:
            return headerCell
        case 1:
            mainCell.checkButton.tag = indexPath.row
            mainCell.checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
            
            mainCell.starButton.tag = indexPath.row
            mainCell.starButton.addTarget(self, action: #selector(starButtonTapped), for: .touchUpInside)
            
            return mainCell
        default:
            return UITableViewCell()
        }
    }
    
    //우측 스와이프 관련 함수
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .normal, title: nil) { (
            UIContextualAction,
            UIView,
            success: @escaping (Bool) -> Void
        ) in
            self.shoppingList.remove(at: indexPath.row)
            print("delete 실행 완료")
            success(true)
        }
        delete.image = UIImage(systemName: "trash.fill")
        delete.image?.withTintColor(.white)
        delete.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    //HeaderCell textField 액션 함수
    @IBAction
    func shoppingTextFieldEditingChanged(_ sender: UITextField) {
        print(#function)
        self.currentTextFieldText = sender.text ?? "허걱"
    }
    
}
