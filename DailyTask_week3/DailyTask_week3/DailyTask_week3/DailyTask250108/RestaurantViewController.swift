//
//  RestaurantViewController.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/8/25.
//

import UIKit

import MapKit

class RestaurantViewController: UIViewController {

    let categoryList = ["한식", "중식", "양식", "기타", "전체"]
    let restauratList = RestaurantList().restaurantArray
    var currentList: [Restaurant] = [] {
        didSet {
            configureMapView()
        }
    }
    var currentAnnotationArr = [MKPointAnnotation]()
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //초기값 세팅
        currentList = restauratList
        
        setRegister()
        setNavUI()
        configureMapView()
    }
    
    func setNavUI() {
        navigationController?.navigationBar.tintColor = .lightGray
        let rightBtn = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(navRightBtnTapped))
        navigationItem.rightBarButtonItem = rightBtn
    }
    
    func setRegister() {
        mapView.delegate = self
    }
    
    //세그먼트 컨트롤 활용
    @IBAction
    func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.filterRestaurant(category: "전체")
        case 1:
            self.filterRestaurant(category: "한식")
        case 2:
            self.filterRestaurant(category: "중식")
        case 3:
            self.filterRestaurant(category: "양식")
        case 4:
            self.filterRestaurant(category: "기타")
        default:
            print("error")
        }
    }

}

private extension RestaurantViewController {
    
    //액션시트 활용
    func showActionSheet(title: String, message: String, actionArr: [String]) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for i in actionArr {
            alert.addAction(UIAlertAction(title: i, style: .default) { action in
                self.filterRestaurant(category: i)
            })
        }
        return alert
    }
    
    func filterRestaurant(category: String) {
        let filterRestaurant = restauratList.filter {
            $0.category == category
        }
        let filterEtcRestaurant = restauratList.filter {
            $0.category == "분식" ||
            $0.category == "카페" ||
            $0.category == "샐러드"
        }
        currentList = (category != "기타" && category != "전체") ? filterRestaurant : filterEtcRestaurant
        if category == "전체" {
            currentList = restauratList
        }
    }
    
    @objc
    func navRightBtnTapped(_ sender: UIButton) {
        print(#function)
        var strArr = [String]()
        for i in categoryList {
            strArr.append(i)
        }
        let alert = showActionSheet(title: "음식 카테고리", message: "고르세용", actionArr: strArr)
        present(alert, animated: true)
    }
    
}

extension RestaurantViewController: MKMapViewDelegate {
 
    func configureMapView() {
        mapView.removeAnnotations(currentAnnotationArr)
        
        let center = CLLocationCoordinate2D(latitude: 37.65370, longitude: 127.04740)
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 800, longitudinalMeters: 800)
        
        let annotationArr = currentList
        
        for i in annotationArr {
            makeMKPointAnnotaion(name: i.name, latitude: i.latitude, longitude: i.longitude)
        }
    }
    
    //경도, 위도, 이름
    func makeMKPointAnnotaion(name: String, latitude: Double, longitude: Double) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        annotation.title = name
        self.mapView.addAnnotation(annotation)
        
        //추후 필터링 때 삭제해야하니 annotation 배열에 담기
        currentAnnotationArr.append(annotation)
    }
    
}
