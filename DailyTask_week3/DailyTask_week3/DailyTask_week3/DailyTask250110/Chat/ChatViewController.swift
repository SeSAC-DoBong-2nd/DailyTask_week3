//
//  ChatViewController.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/11/25.
//

import UIKit

import SnapKit

//ChatList 원소 중 채팅과 날짜절취선 다루기 위한 enum
enum ChatListItem {
    
    case chat(Chat)
    case dateLine(String)
    
}

class ChatViewController: UIViewController {

    @IBOutlet var chatTableView: UITableView!
    @IBOutlet var textFieldContainer: UIView!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var textView: UITextView!
    //    @IBOutlet var textField: UITextField!
    
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
//        textField.delegate = self
        textView.delegate = self
        
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        
        let id = OtherChatTableViewCell.identifier
        let nib = UINib(nibName: id, bundle: nil)
        chatTableView.register(nib, forCellReuseIdentifier: id)
        
        let id2 = MyChatTableViewCell.identifier
        let nib2 = UINib(nibName: id2, bundle: nil)
        chatTableView.register(nib2, forCellReuseIdentifier: id2)
        
        let id3 = DateLineTableViewCell.identifier
        let nib3 = UINib(nibName: id3, bundle: nil)
        chatTableView.register(nib3, forCellReuseIdentifier: id3)
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
        
        sendButton.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        sendButton.tintColor = .lightGray
        
        textView.text = "메세지를 입력하세요"
        textView.textColor = .lightGray
        textView.backgroundColor = .clear
        textView.borderStyle  = .none
        //        textField.placeholder = "메세지를 입력하세요"
        //        textField.keyboardType = .default
        //        textField.borderStyle = .none
        //        textField.backgroundColor = .clear
    }
    
    func setLayout() {
        view.keyboardLayoutGuide.snp.makeConstraints {
            $0.top.equalTo(textFieldContainer.snp.bottom).offset(10).constraint.isActive = true
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
    
    func generateProcessedChatList() -> [ChatListItem] {
        var processedList: [ChatListItem] = []
        
        for (index, chat) in currentChatList.chatList.enumerated() {
            processedList.append(.chat(chat))
            
            if index < currentChatList.chatList.count - 1 {
                let currentDate = chat.date.split(separator: " ")[0]
                let nextDate = currentChatList.chatList[index + 1].date.split(separator: " ")[0]
                
                if currentDate != nextDate {
                    processedList.append(.dateLine(String(nextDate)))
                }
            }
        }
        
        return processedList
    }

    
    @objc
    func navLeftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func sendButtonTapped() {
        print(#function)
        if currentTextFieldText != "메세지를 입력하세요" && !currentTextFieldText.isEmpty {
            let date = CustomDateFormatter.shard.setTodayDate()
            
            currentChatList.chatList.append(
                Chat(user: .user, date: date, message: currentTextFieldText)
            )
            textView.text.removeAll()
        }
//        textField.text?.removeAll()
    }
    
}

//MARK: - UITextFieldDelegate
//extension ChatViewController: UITextFieldDelegate {
//
//    func textFieldDidChangeSelection(_ textField: UITextField) {
//        guard let text = textField.text else {
//            print("textFieldDidChangeSelection error")
//            return
//        }
//        print(#function, text)
//        currentTextFieldText = text
//    }
//    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print(#function)
//        
//        scrollToBottom()
//    }
//    
//}

//MARK: - UITextViewDelegate
extension ChatViewController: UITextViewDelegate {
    
    // MARK: textview 높이 자동조절
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        textView.constraints.forEach { (constraint) in
            /// 180 이하일때는 더 이상 줄어들지 않게하기
            if estimatedSize.height <= 48 {
            } else {
                if constraint.firstAttribute == .height {
                    constraint.constant = estimatedSize.height
                }
            }
        }
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if textView.text == "메세지를 입력하세요" {
            textView.text = ""
        }
        textView.textColor = .black
        return true
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        guard let text = textView.text else {
            print("textFieldDidChangeSelection error")
            return
        }
        if text != "메세지를 입력하세요" {
            sendButton.tintColor = (text.count == 0) ? .lightGray : .black
            currentTextFieldText = text
        }
        print(#function, text)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "메세지를 입력하세요"
            textView.textColor = .lightGray
        }
    }
    
}

//MARK: - UITableViewDelegate
extension ChatViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(currentChatList.chatList[indexPath.row])
    }
    
}

//MARK: - UITableViewDataSource
extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return generateProcessedChatList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let noSeparatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        
        let processedList = generateProcessedChatList()
        let item = processedList[indexPath.row]
        
        switch item {
        case .chat(let chat):
            if chat.user == .user {
                let myChatCell = tableView.dequeueReusableCell(withIdentifier: MyChatTableViewCell.identifier, for: indexPath) as! MyChatTableViewCell
                myChatCell.setMyChatCellUI(
                    date: CustomDateFormatter.shard.setDateInChat(strDate: chat.date),
                    message: chat.message
                )
                myChatCell.separatorInset = noSeparatorInset
                return myChatCell
            } else {
                let otherChatCell = tableView.dequeueReusableCell(withIdentifier: OtherChatTableViewCell.identifier, for: indexPath) as! OtherChatTableViewCell
                otherChatCell.setOtherChatCellUI(
                    user: chat.user.rawValue,
                    date: CustomDateFormatter.shard.setDateInChat(strDate: chat.date),
                    message: chat.message
                )
                otherChatCell.separatorInset = noSeparatorInset
                return otherChatCell
            }
            
        case .dateLine(let date):
            let dateLineCell = tableView.dequeueReusableCell(withIdentifier: DateLineTableViewCell.identifier, for: indexPath) as! DateLineTableViewCell
            dateLineCell.setDateLineCellUI(date: date)
            dateLineCell.separatorInset = noSeparatorInset
            return dateLineCell
        }
    }
    
}


//MARK: - MEMO
//+@ 코드 중 주석 처리한 부분은 textView 이전 textField로 작업한 부분입니다!

/**
 1. cell 사이 간격을 주고자 layoutSubviews를 활용하여 contentView inset을 설정하였으나, 채팅cell이 잘린다.
    어떻게 해결해야 할까?
      - collectionView가 제일 좋은 방법인 것 같다.
 2. textView의 크기가 위로 어떻게 늘어나야하는 걸까..
    - 현재는 scrollEnabled를 false로 바꿔 height를 그대로 적용하도록 했는데, 줄바꿈을 하면 아래로 커지는 상황이라 글자가 보이지 않는다..
    - priority 설정을 활용해야하나..?
 3. scrollToBottom이 textView로 바꾸고 sendBtnTapped으로 내 채팅을 추가하면 내려가는 기능이 적용되지 않는다..
 **/
