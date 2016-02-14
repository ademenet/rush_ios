//
//  PoneyListViewController.swift
//  poney
//
//  Created by Alain DEMENET on 2/13/16.
//  Copyright © 2016 Alain DEMENET. All rights reserved.
//

import UIKit
import MapKit

let mapViewControllerIndex = 0

class PoneyListViewController: UITableViewController {

  var sections = [[PoneyShop]](count: PoneyShopType.Count.hashValue, repeatedValue: [PoneyShop]())

  override func viewDidLoad() {
    super.viewDidLoad()

    // init poneyShops from tab bar data
    let tabBarController = self.tabBarController as! PoneyTabBarController

    let poneyShops = tabBarController.poneyShops
    for shop in poneyShops {
      sections[shop.type.hashValue] += [shop]
    }
  }

  // Table View Protocol

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return sections.count
  }

  let sectionsTitles = [
    "Night Clubs",
    "Bars",
    "Coffees",
    "Parks",
    "Shops",
  ]

  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return sectionsTitles[section]
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sections[section].count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cellIdentifier = "PoneyCellIdentifier"
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! PoneyCell
    cell.nameLabel.text = sections[indexPath.section][indexPath.row].name
    cell.descriptionLabel.text = sections[indexPath.section][indexPath.row].description
    return cell
  }

  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    let mapViewController = self.tabBarController?.viewControllers![mapViewControllerIndex] as! MapViewController

    // prepare initialLocation for map view
    let location: CLLocation = sections[indexPath.section][indexPath.row].location
    mapViewController.centerMapOnLocation(location)

    // switch to MapView tab
    self.tabBarController?.selectedIndex = mapViewControllerIndex
  }
  
}
