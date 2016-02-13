//
//  PoneyListViewController.swift
//  poney
//
//  Created by Alain DEMENET on 2/13/16.
//  Copyright © 2016 Alain DEMENET. All rights reserved.
//

import UIKit
import MapKit

struct Poney {
  var name: String
  var description: String
  var coordinate: CLLocationCoordinate2D

  init(name: String, description: String, coordinate: CLLocationCoordinate2D) {
    self.name = name
    self.description = description
    self.coordinate = coordinate
  }
}

class PoneyListViewController: UITableViewController {

  var poneys = [Poney]()

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    let poney1 = Poney(name: "bob", description: "joly", coordinate: CLLocationCoordinate2D(latitude: 48.8965, longitude: 2.318))
    let poney2 = Poney(name: "alain", description: "moche", coordinate: CLLocationCoordinate2D(latitude: 49.89661, longitude: 2.31))
    poneys += [poney1, poney2]
  }

  // Table View Protocol

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return poneys.count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cellIdentifier = "PoneyCellIdentifier"
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! PoneyCell
    cell.nameLabel.text = poneys[indexPath.row].name
    cell.descriptionLabel.text = poneys[indexPath.row].description
    return cell
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowMap" {
      if let indexPath = self.tableView.indexPathForSelectedRow {
        let destinationVC = segue.destinationViewController as! MapViewController
        let c = poneys[indexPath.row].coordinate
        destinationVC.initialLocation = CLLocation(latitude: c.latitude, longitude: c.longitude)
      }
    }
  }
}
