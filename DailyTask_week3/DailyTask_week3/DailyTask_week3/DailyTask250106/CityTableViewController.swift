//
//  CityTableViewController.swift
//  DailyTask_week2
//
//  Created by 박신영 on 1/7/25.
//

import UIKit

class CityTableViewController: UITableViewController {
    
    let cityInfoList = CityInfo().city
    //현재 보여지는 cityList 담은 배열
    var currentCityList: [City] = []
    //현재 선택된 segmentControl Index
    var currentSegmentIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: CityTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CityTableViewCell.identifier)
        
        tableView.rowHeight = 160
        
        //초기 값 세팅
        currentCityList = cityInfoList
//        setupSearchController()
    }
    
    func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search Dj"
        searchController.hidesNavigationBarDuringPresentation = false
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func filterAndReloadData(searchText: String?) {
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
        
        // 검색어 필터링 추가 적용
        
        if let searchText = searchText, !searchText.isEmpty {
            //1번에서 필터링한 값에 searchText 값이 포함된 값들이 있으면 true로 취급하여 currentCityList에 남겨둠
            currentCityList = filteredBySegment.filter {
                $0.cityTotalName.uppercased().contains(searchText.uppercased()) || $0.cityExplain.uppercased().contains(searchText.uppercased())
            }
        } else {
            currentCityList = filteredBySegment
        }
        
        tableView.reloadData()
    }

    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return currentCityList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityCell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier) as! CityTableViewCell
        let cityCellRow = currentCityList[indexPath.row]
        let image = cityCellRow.cityImage
        let cityName = cityCellRow.cityTotalName
        let cityExplain = cityCellRow.cityExplain
        
        cityCell.setCityCellUI(image: image, cityNameText: cityName, explainText: cityExplain)
        
        return cityCell
    }
    
    @IBAction
    func segmentValueChangedAction(_ sender: UISegmentedControl) {
        currentSegmentIndex = sender.selectedSegmentIndex
        filterAndReloadData(searchText: nil)
    }
    
    @IBAction
    func searchTextFieldEditingChanged(_ sender: UITextField) {
        let searchText = sender.text ?? ""
        let whitespacesFilter = searchText.trimmingCharacters(in: .whitespaces)
        
        // searchTextField text 기반 필터링
        filterAndReloadData(searchText: whitespacesFilter)
    }
    
    @IBAction
    func keyboardDismissAction(_ sender: UITextField) {
    }
    
}
