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

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowMap" {
      let destinationVC = segue.destinationViewController as! MapViewController
      if let indexPath = tableView.indexPathForSelectedRow {
        let shop = sections[indexPath.section][indexPath.row]
        destinationVC.initialLocation = shop.location
        destinationVC.initialMapType = .Standard

        destinationVC.displayAllPins = false

        destinationVC.pins = [Pin(type: shop.type, title: shop.name, subtitle: shop.description, coordinate: shop.location.coordinate)]
        destinationVC.navigationItem.title = shop.name
      }
    }
  }

}
