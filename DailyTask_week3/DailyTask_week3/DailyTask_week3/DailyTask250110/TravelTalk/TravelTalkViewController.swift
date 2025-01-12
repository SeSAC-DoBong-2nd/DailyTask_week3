//
//  TravelTalkViewController.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/11/25.
//

import UIKit

class TravelTalkViewController: UIViewController {

    @IBOutlet var travelTalkCollectionView: UICollectionView!
    @IBOutlet var navigationUnderLineView: UIView!
    
    let searchController = UISearchController()
    let chatMockList: [ChatRoom] = MockChatList().mockChatList
    var currentChatList: [ChatRoom] = [] {
        didSet {
            travelTalkCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentChatList = chatMockList
        setRegister()
        setTopUI()
        setCollectionViewLayout()
    }
    
    func setRegister() {
        searchController.searchBar.delegate = self
        
        let id = TravelTalkCollectionViewCell.identifier
        let xib = UINib(nibName: id, bundle: nil)
        let id2 = GroupTravelTalkCollectionViewCell.identifier
        let xib2 = UINib(nibName: id2, bundle: nil)
        travelTalkCollectionView.register(xib, forCellWithReuseIdentifier: id)
        travelTalkCollectionView.register(xib2, forCellWithReuseIdentifier: id2)
        
        travelTalkCollectionView.delegate = self
        travelTalkCollectionView.dataSource = self
    }
    
    func setTopUI() {
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "친구 이름을 검색해보세요"
        
        navigationUnderLineView.backgroundColor = .lightGray
    }
    
    func setCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 12 //세로 간격
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        let screenWidth = UIScreen.main.bounds.width
        
        layout.itemSize = CGSize(width: screenWidth, height: 100)
        
        travelTalkCollectionView.collectionViewLayout = layout
    }

}

//MARK: - UISearchBarDelegate
extension TravelTalkViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(#function)
        var filterChatList = chatMockList
        filterChatList = filterChatList.filter {
            $0.chatList.contains {
                $0.user.rawValue.uppercased() == searchText.uppercased()
            }
        }
        
        if searchText.isEmpty {
            currentChatList = chatMockList
            return
        }
        currentChatList = filterChatList
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        currentChatList = chatMockList
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
}

//MARK: - UICollectionViewDelegate
extension TravelTalkViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let chatRoom = currentChatList[indexPath.item]
        
        //1. 뷰컨트롤러가 위치한 스토리보드 특정
        let sb = UIStoryboard(name: "Chatting", bundle: nil)
        
        //2. 전환할 뷰컨트롤러 가져오기
        let vc = sb.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
        
        //ChatRoom 형태의 데이터 넘겨주기
        vc.chatList = chatRoom
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: - UICollectionViewDataSource
extension TravelTalkViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentChatList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let chatRoom = currentChatList[indexPath.item]
        let date = chatRoom.chatList[chatRoom.chatList.count-1].date
        
        if chatRoom.chatroomId == 1 {
            let groupCell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupTravelTalkCollectionViewCell.identifier, for: indexPath)
            as! GroupTravelTalkCollectionViewCell
            
            groupCell.setTravelTalkCellUI(
                image: chatRoom.chatroomImage,
                nickname: chatRoom.chatroomName,
                message: chatRoom.chatList[chatRoom.chatList.count-1].message,
                date: CustomDateFormatter.shard.setDateInTravelTalk(strDate: date)
            )
            
            return groupCell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TravelTalkCollectionViewCell.identifier, for: indexPath)
            as! TravelTalkCollectionViewCell
            cell.setTravelTalkCellUI(
                image: chatRoom.chatroomImage,
                nickname: chatRoom.chatroomName,
                message: chatRoom.chatList[chatRoom.chatList.count-1].message,
                date: CustomDateFormatter.shard.setDateInTravelTalk(strDate: date)
            )
            
            return cell
        }
    }
    
}
