//
//  RestaurantViewController.swift
//  DailyTask_week3
//
//  Created by 박신영 on 1/8/25.
//

import UIKit

import MapKit

class RestaurantViewController: UIViewController {

    let restauratList = RestaurantList().restaurantArray
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    @objc
    func navRightBtnTapped(_ sender: UIButton) {
        print(#function)
        var strArr = [String]()
        for i in restauratList {
            strArr.append(i.name)
        }
        let alert = UIAlertUtil.showActionSheet(title: "장소", message: "오잉", actionArr: strArr)
        present(alert, animated: true)
    }
    


}

extension RestaurantViewController: MKMapViewDelegate {
 
    func configureMapView() {
        let center = CLLocationCoordinate2D(latitude: 37.65370, longitude: 127.04740)
        
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 800, longitudinalMeters: 800)
        
        let annotationArr = restauratList
        
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
    }
    
}
