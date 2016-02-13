//
//  MapViewController.swift
//  poney
//
//  Created by Alain DEMENET on 2/13/16.
//  Copyright © 2016 Alain DEMENET. All rights reserved.
//

import UIKit
import MapKit

let coordinates42 = CLLocationCoordinate2D(
  latitude: 48.8965575773125,
  longitude: 2.31843883360993
)

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

class MapViewController: UIViewController {

  @IBOutlet weak var mapView: MKMapView!
  let regionRadius: CLLocationDistance = 200



  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    let initialLocation = CLLocation(latitude: coordinates42.latitude, longitude: coordinates42.longitude)

    centerMapOnLocation(initialLocation)
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

  func centerMapOnLocation(location: CLLocation) {
    let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
      regionRadius * 2.0, regionRadius * 2.0)
    mapView.setRegion(coordinateRegion, animated: true)
  }

}
