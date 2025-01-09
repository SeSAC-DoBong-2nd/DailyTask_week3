//
//  TopCitiesViewController.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/7/25.
//

import UIKit

class TopCitiesViewController: UIViewController {
    
    let cityInfoList = CityInfo().city
    //현재 보여지는 cityList 담은 배열
    var currentCityList: [City] = []
    //현재 선택된 segmentControl Index
    var currentSegmentIndex: Int = 0

    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //초기 값 세팅
        currentCityList = cityInfoList
        setRegister()
        setCollectionView()
        setNav()
    }
    
}


//MARK: - private extension

private extension TopCitiesViewController {
    
    func setRegister() {
        let xib = UINib(nibName: "TopCitiesCollectionViewCell", bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "TopCitiesCollectionViewCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10 //가로 간격
        layout.minimumLineSpacing = 20 //세로 간격
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let screenWidth = UIScreen.main.bounds.width
        let width = (screenWidth/2) - 30
        
        layout.itemSize = CGSize(width: width, height: width + 50)
        
        collectionView.collectionViewLayout = layout
    }
    
    func setNav() {
        let rightBtn = UIBarButtonItem(title: "도시 상세 정보", style: .plain, target: self, action: #selector(rightNavButtonTapped))
        navigationItem.rightBarButtonItem = rightBtn
    }
    
    func filterAndReloadData(searchText: String?) {
        // 1.selectedSegIndex 상태에 따른 기본 필터링
        let filteredBySegment: [City]
        switch currentSegmentIndex {
        case 0: // 모두 보기
            filteredBySegment = cityInfoList
        case 1: // 국내 보기
            filteredBySegment = cityInfoList.filter { $0.domesticTravel }
        case 2: // 해외 보기
            filteredBySegment = cityInfoList.filter { !$0.domesticTravel }
        default: // 디폴트
            filteredBySegment = cityInfoList
        }
        currentCityList = filteredBySegment
        
        collectionView.reloadData()
    }
    
    @IBAction
    func segmentValueChangedAction(_ sender: UISegmentedControl) {
        currentSegmentIndex = sender.selectedSegmentIndex
        filterAndReloadData(searchText: nil)
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
    
}


//MARK: - UICollectionViewDelegate

extension TopCitiesViewController: UICollectionViewDelegate {
    
}


//MARK: - UICollectionViewDataSource

extension TopCitiesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentCityList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cityCell = collectionView.dequeueReusableCell(withReuseIdentifier: TopCitiesCollectionViewCell.identifier, for: indexPath) as! TopCitiesCollectionViewCell
        
        let cityCellRow = currentCityList[indexPath.row]
        cityCell.imageURL = cityCellRow.cityImage
        cityCell.titleText = cityCellRow.cityTotalName
        cityCell.subtitleText = cityCellRow.cityExplain
        
        DispatchQueue.main.async {
            cityCell.setUI()
        }
        
        return cityCell
    }
    
    
}
