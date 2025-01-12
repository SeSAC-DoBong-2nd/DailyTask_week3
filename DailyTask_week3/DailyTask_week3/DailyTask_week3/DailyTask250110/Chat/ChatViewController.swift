//
//  ChatViewController.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/11/25.
//

import UIKit

import SnapKit

class ChatViewController: UIViewController {

    @IBOutlet var chatTableView: UITableView!
    @IBOutlet var textFieldContainer: UIView!
    @IBOutlet var textField: UITextField!
    @IBOutlet var sendButton: UIButton!
    
    var currentTextFieldText: String = ""
    
    //dummy data 세팅
    var chatList: ChatRoom = ChatRoom(
        chatroomId: 0,
        chatroomImage: [""],
        chatroomName: "",
        chatList: [Chat(
            user: .bran,
            date: "",
            message: ""
        )]
    )
    lazy var currentChatList: ChatRoom = chatList {
        didSet {
            chatTableView.reloadData()
            //내가 작성한 데이터 반영 이후 제일 하단으로 스크롤 이동하기 위함
            scrollToBottom()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setRegister()
        setNavUI()
        setUI()
        setLayout()
        scrollToBottom()
    }
    
    func setRegister() {
        textField.delegate = self
        
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        
        let id = OtherChatTableViewCell.identifier
        let nib = UINib(nibName: id, bundle: nil)
        chatTableView.register(nib, forCellReuseIdentifier: id)
        
        let id2 = MyChatTableViewCell.identifier
        let nib2 = UINib(nibName: id2, bundle: nil)
        chatTableView.register(nib2, forCellReuseIdentifier: id2)
    }
    
    func setNavUI() {
        navigationItem.title = chatList.chatroomName
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.backward"),
            style: .done,
            target: self,
            action: #selector(navLeftButtonTapped)
        )
    }
    
    func setUI() {
        textFieldContainer.layer.cornerRadius = 10
        textFieldContainer.backgroundColor = ._250110TextFieldBackground
        textField.placeholder = "메세지를 입력하세요"
        textField.keyboardType = .default
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        
        sendButton.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        sendButton.tintColor = .lightGray
    }
    
    func setLayout() {
        view.keyboardLayoutGuide.snp.makeConstraints {
            $0.top.equalTo(textFieldContainer.snp.bottom).offset(16).constraint.isActive = true
        }
        
        chatTableView.rowHeight = UITableView.automaticDimension
    }
    
    @IBAction
    func keyboardDismiss(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

}

private extension ChatViewController {
    
    func scrollToBottom(){
        DispatchQueue.main.async {
            //currentChatList.chatList가 1개 이상이라면
            if self.currentChatList.chatList.count > 0 {
                //제일 마지막 행의 IndexPath 값을 lastRow에 대입
                let lastRow = IndexPath(row: self.currentChatList.chatList.count-1, section: 0)
                self.chatTableView.scrollToRow(at: lastRow, at: .bottom, animated: true)
            }
        }
    }
    
    @objc
    func navLeftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func sendButtonTapped() {
        print(#function)
        let date = CustomDateFormatter.shard.setTodayDate()
        
        currentChatList.chatList.append(
            Chat(user: .user, date: date, message: currentTextFieldText)
        )
        textField.text?.removeAll()
        
    }
    
}

extension ChatViewController: UITextFieldDelegate {

    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else {
            print("textFieldDidChangeSelection error")
            return
        }
        print(#function, text)
        currentTextFieldText = text
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        
        scrollToBottom()
    }
    
}

extension ChatViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(currentChatList.chatList[indexPath.row])
    }
    
}

extension ChatViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentChatList.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let noSeparatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        let chatList = currentChatList.chatList[indexPath.row]
        
        switch chatList.user {
        case .user:
            let myChatCell = tableView.dequeueReusableCell(withIdentifier: MyChatTableViewCell.identifier)
                as! MyChatTableViewCell
            myChatCell.setMyChatCellUI(
                date: CustomDateFormatter.shard.setDateInChat(strDate: chatList.date),
                message: chatList.message
            )
            myChatCell.separatorInset = noSeparatorInset
            
            return myChatCell
        default:
            let otherChatCell = tableView.dequeueReusableCell(withIdentifier: OtherChatTableViewCell.identifier)
                as! OtherChatTableViewCell
            
            otherChatCell.setOtherChatCellUI(
                user: chatList.user.rawValue,
                date: CustomDateFormatter.shard.setDateInChat(strDate: chatList.date),
                message: chatList.message
            )
            otherChatCell.separatorInset = noSeparatorInset
            
            return otherChatCell
        }
    }
    
}

/**
 1. cell 사이 간격을 주고자 layoutSubviews를 활용하여 contentView inset을 설정하였으나, 채팅cell이 잘린다.
    어떻게 해결해야 할까?
      - collectionView가 제일 좋은 방법인 것 같다.
 **/
