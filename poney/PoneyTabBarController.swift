//
//  PoneyTabBarController.swift
//  poney
//
//  Created by Yoann CRIBIER on 2/13/16.
//  Copyright © 2016 Alain DEMENET. All rights reserved.
//

import UIKit
import MapKit

class PoneyTabBarController: UITabBarController {

  // Holds all the data
  var poneyShops: [PoneyShop] = [
    PoneyShop(name: "Poneysher", description: "Hardcore & Gothic poneys", location: CLLocation(latitude: 48.8965, longitude: 2.318)),
    PoneyShop(name: "Po Po Adventure", description: "Come play with sweet poneys!", location: CLLocation(latitude: 49.89661, longitude: 2.31)),
    PoneyShop(name: "Rainbow Poney Club", description: "Come, it's so fun", location: CLLocation(latitude: 49.89661, longitude: 2.31))
  ]

}
