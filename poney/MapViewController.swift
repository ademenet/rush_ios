//
//  MapViewController.swift
//  poney
//
//  Created by Alain DEMENET on 2/13/16.
//  Copyright © 2016 Alain DEMENET. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

let coordinates42 = CLLocationCoordinate2D(
  latitude: 48.8965575773125,
  longitude: 2.31843883360993
)
let initialLocation = CLLocation(latitude: coordinates42.latitude, longitude: coordinates42.longitude)

let initialMapType: MKMapType = .Satellite

class Pin: NSObject, MKAnnotation {
  var coordinate: CLLocationCoordinate2D
  var title: String?
  var subtitle: String?

  init(title: String?, subtitle: String?, coordinate: CLLocationCoordinate2D) {
    self.coordinate = coordinate
    self.title = title
    self.subtitle = subtitle

    super.init()
  }
}

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var segmentedControl: UISegmentedControl!

  let mapTypes: [MKMapType] = [.Standard, .Satellite, .Hybrid]

  @IBAction func onSegmentedControlChanged(sender: UISegmentedControl) {
    mapView.mapType = mapTypes[sender.selectedSegmentIndex]
  }

  let regionRadius: CLLocationDistance = 200

  let locationManager = CLLocationManager()

  override func viewDidLoad() {
    super.viewDidLoad()

    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestAlwaysAuthorization()
    locationManager.startUpdatingLocation()
    locationManager.requestWhenInUseAuthorization()

    mapView.showsUserLocation = true

    mapView.mapType = initialMapType
    segmentedControl.selectedSegmentIndex = Int(initialMapType.rawValue)

    // Initialise map position
    centerMapOnLocation(initialLocation)

    // Add 42 Pin
    let pin42 = Pin(title: "42 School", subtitle: "96 Boulevard Bessières, 75017 Paris, France", coordinate: coordinates42)
    mapView.addAnnotation(pin42)

    let longPressRecogniser = UILongPressGestureRecognizer(target: self, action: "handleLongPress:")

    longPressRecogniser.minimumPressDuration = 1.0
    mapView.addGestureRecognizer(longPressRecogniser)
  }

  func handleLongPress(getstureRecognizer : UIGestureRecognizer){
    if getstureRecognizer.state != .Began { return }

    let touchPoint = getstureRecognizer.locationInView(self.mapView)
    let touchMapCoordinate = mapView.convertPoint(touchPoint, toCoordinateFromView: mapView)
    print(touchMapCoordinate)
    let annotation = MKPointAnnotation()
    annotation.coordinate = touchMapCoordinate

    mapView.addAnnotation(annotation)
  }

  @IBAction func onCurrentLocationPressed(sender: UIButton) {
    if let currentLocation = locationManager.location {
      centerMapOnLocation(currentLocation)
    }
  }

//  func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//    if let location = locations.last {
//      centerMapOnLocation(location)
//    }
//
//    manager.stopUpdatingLocation()
//  }

  func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
    print("locationManager Error: " + error.localizedDescription)
  }

  func centerMapOnLocation(location: CLLocation) {
    let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
      regionRadius * 2.0, regionRadius * 2.0)
    mapView.setRegion(coordinateRegion, animated: true)
  }

}
