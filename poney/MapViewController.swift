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

class Pin: NSObject, MKAnnotation {
  var type: PoneyShopType
  var title: String?
  var subtitle: String?
  var coordinate: CLLocationCoordinate2D

  var pinColor: UIColor {
    switch self.type {
    case .NightClub: return UIColor.purpleColor()
    case .Bar: return UIColor.blueColor()
    case .Coffee: return UIColor.brownColor()
    case .Park: return UIColor.greenColor()
    case .Shop: return UIColor(hexString: "#EEA6C8")!
    default: return UIColor.redColor()
    }
  }

  init(type: PoneyShopType, title: String?, subtitle: String?, coordinate: CLLocationCoordinate2D) {
    self.type = type
    self.coordinate = coordinate
    self.title = title
    self.subtitle = subtitle

    super.init()
  }
}

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var segmentedControl: UISegmentedControl!

  var initialLocation = CLLocation(latitude: coordinates42.latitude, longitude: coordinates42.longitude)
  var initialMapType: MKMapType = .Satellite

  let mapTypes: [MKMapType] = [.Standard, .Satellite, .Hybrid]

  var pins: [Pin] = [Pin]()
  var displayAllPins = true

  @IBAction func onSegmentedControlChanged(sender: UISegmentedControl) {
    mapView.mapType = mapTypes[sender.selectedSegmentIndex]
  }

  let regionRadius: CLLocationDistance = 200

  let locationManager = CLLocationManager()

  override func viewDidLoad() {
    super.viewDidLoad()

    self.mapView.delegate = self

    locationManager.requestWhenInUseAuthorization()

    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestAlwaysAuthorization()
    locationManager.startUpdatingLocation()

    self.mapView.showsUserLocation = true

    self.mapView.mapType = initialMapType
    segmentedControl.selectedSegmentIndex = Int(initialMapType.rawValue)

    // Initialise map position
    centerMapOnLocation(initialLocation)

    if displayAllPins {
      // Add 42 Pin
      pins += [Pin(type: .Bar, title: "42 School", subtitle: "96 Boulevard Bessières, 75017 Paris, France", coordinate: coordinates42)]

      // Init poney shops annotations
      let tabBarController = self.tabBarController as! PoneyTabBarController
      let poneyShops = tabBarController.poneyShops
      for shop in poneyShops {
        pins += [Pin(type: shop.type, title: shop.name, subtitle: shop.description, coordinate: shop.location.coordinate)]
      }
    }

    self.mapView.addAnnotations(pins)

    // display annotation
    if let firstPin: Pin = pins[0] {
      self.mapView.selectAnnotation(firstPin, animated: true)
    }

    // +
    let longPressRecogniser = UILongPressGestureRecognizer(target: self, action: "handleLongPress:")

    longPressRecogniser.minimumPressDuration = 1.0
    mapView.addGestureRecognizer(longPressRecogniser)
  }

  func handleLongPress(getstureRecognizer : UIGestureRecognizer) {
    if getstureRecognizer.state != .Began { return }

    let touchPoint = getstureRecognizer.locationInView(self.mapView)
    let touchMapCoordinate = mapView.convertPoint(touchPoint, toCoordinateFromView: mapView)
    let annotation = MKPointAnnotation()
    annotation.coordinate = touchMapCoordinate

    mapView.addAnnotation(annotation)
  }

  func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
    if let pin = annotation as? Pin {
      let identifier = "pin"
      var view: MKPinAnnotationView
      if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView {
        dequeuedView.annotation = pin
        view = dequeuedView
      } else {
        view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        view.canShowCallout = true
        view.calloutOffset = CGPoint(x: -5, y: 5)
        view.rightCalloutAccessoryView = UIButton(type: .Custom) as UIView
      }
      view.pinTintColor = pin.pinColor
      return view
    }
    return nil
  }

  @IBAction func onCurrentLocationPressed(sender: UIButton) {
    if let currentLocation = locationManager.location {
      centerMapOnLocation(currentLocation)
    }
  }

  func centerMapOnLocation(location: CLLocation) {
    let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
      regionRadius * 2.0, regionRadius * 2.0)
    mapView.setRegion(coordinateRegion, animated: true)
  }
  
}
