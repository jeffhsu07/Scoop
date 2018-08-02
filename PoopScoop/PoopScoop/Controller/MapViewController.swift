//
//  ViewController.swift
//  PoopScoop
//
//  Created by jeff hsu on 7/29/18.
//  Copyright © 2018 Jeffrey Hsu. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

struct location {
    var name: String
    var latitude: Double
    var longitude: Double
}
class MapViewController: UIViewController {
    
    //TO-DO: SHOW MARKERS FOR TESTING
    
    //TO-DO: IMPLEMENT SUMMARY VIEW?
    
    //TO-DO: IMPORT SNAPKIT INTO PROJECT
    
    let currentLocation = GMSMarker()
    let locationManager = CLLocationManager()
    let mapView = GMSMapView()
    let goToMyLocationButton = UIButton()
    
    let customMarkerWidth: Int = 50
    let customMarkerHeight: Int = 70
    
    var restaurantPreviewView: PreviewView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        self.view.backgroundColor = UIColor.white
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.delegate = self
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
        
        searchTextField.delegate = self
        
        setupViews()
        setupGoToMyLocationButton()
        initGoogleMaps()
    }
    
    private func setupViews() {
        view.addSubview(mapView)
        mapView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mapView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 60).isActive = true
        
        view.addSubview(searchTextField)
        searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        searchTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        searchTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        view.addSubview(goToMyLocationButton)
        goToMyLocationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        goToMyLocationButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        goToMyLocationButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        goToMyLocationButton.heightAnchor.constraint(equalTo: goToMyLocationButton.widthAnchor).isActive = true
        
        restaurantPreviewView = PreviewView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 190))
    }

    private func initGoogleMaps() {
        let camera = GMSCameraPosition.camera(withLatitude: 28.7041, longitude: 77.1025, zoom: 17.0)
        mapView.camera = camera
        mapView.isMyLocationEnabled = true
    }
    
    //TO-DO: ADD TARGET
    //TO-DO: ADD IMAGE LITERAL
    private func setupGoToMyLocationButton() {
        goToMyLocationButton.translatesAutoresizingMaskIntoConstraints = false
        goToMyLocationButton.backgroundColor = UIColor.black
        goToMyLocationButton.layer.cornerRadius = 25
        goToMyLocationButton.clipsToBounds = true
        goToMyLocationButton.tintColor = UIColor.gray
        goToMyLocationButton.setTitle("Button", for: .normal)
        goToMyLocationButton.addTarget(self, action: #selector(goToMyLocationButtonDidTap), for: .touchUpInside)
    }
    
    func showNearbyBathrooms(latitude: Double, longitude: Double) {
        mapView.clear()
        
        let customMarker = CustomMarkerView(frame: CGRect(x: 0, y: 0, width: customMarkerWidth, height: customMarkerHeight), borderColor: UIColor.lightGray)
        let marker = GMSMarker()
        marker.iconView = customMarker
        
        let randNum=Double(arc4random_uniform(30))/10000
        marker.position = CLLocationCoordinate2D(latitude: latitude+randNum, longitude: longitude-randNum)
        
        marker.map = mapView
    }
    
    @objc func goToMyLocationButtonDidTap() {
         if let userLocation = mapView.myLocation {
            mapView.animate(toLocation: userLocation.coordinate)
        }
    }
    
    let searchTextField: UITextField = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor.white
        textField.layer.borderColor = UIColor.darkGray.cgColor
        textField.placeholder = "Search for a location"
        
        return textField
    }()

}

//MARK: TEXTFIELD DELEGATE
extension MapViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let autoCompleteController = GMSAutocompleteViewController()
        autoCompleteController.delegate = self
        
        let filter = GMSAutocompleteFilter()
        autoCompleteController.autocompleteFilter = filter
        
        self.locationManager.startUpdatingLocation()
        self.present(autoCompleteController, animated: true, completion: nil)
        
        return false
    }
}

//MARK: CLLOCATION MANAGER DELEGATE
extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error while getting location")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.delegate = nil
        locationManager.stopUpdatingLocation()
        
        let location = locations.last
        let latitude = location?.coordinate.latitude
        let longitude = location?.coordinate.longitude
        let camera = GMSCameraPosition.camera(withLatitude: latitude!, longitude: longitude!, zoom: 17.0)
        
        showNearbyBathrooms(latitude: latitude!, longitude: longitude!)
        self.mapView.animate(to: camera)
    }
}

//MARK: GOOGLE SEARCH AUTO COMPLETE DELEGATE
extension MapViewController: GMSAutocompleteViewControllerDelegate {
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        let latitude = place.coordinate.latitude
        let longitude = place.coordinate.longitude
        
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 17.0)
        mapView.camera = camera
        
        searchTextField.text = place.formattedAddress
        
        let searchedLocationMarker = GMSMarker()
        
        searchedLocationMarker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        searchedLocationMarker.title = place.formattedAddress
        searchedLocationMarker.snippet = place.formattedAddress
        searchedLocationMarker.map = mapView
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("Error")
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: GOOGLE MAP DELEGATE
extension MapViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        let customMarker = CustomMarkerView(frame: CGRect(x: 0, y: 0, width: customMarkerWidth, height: customMarkerHeight), borderColor: UIColor.darkGray)
        marker.iconView = customMarker
        
        return false
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoContents marker: GMSMarker) -> UIView? {
        return restaurantPreviewView
    }
    
    func mapView(_ mapView: GMSMapView, didCloseInfoWindowOf marker: GMSMarker) {
        let customMarker = CustomMarkerView(frame: CGRect(x: 0, y: 0, width: customMarkerWidth, height: customMarkerHeight), borderColor: UIColor.lightGray)
        marker.iconView = customMarker
    }
    //TO-DO: LAST THREE GOOGLE MAPS DELEGATE FUNCTIONS
    //TBH NOT SURE HOW TO DO THIS RN
}
