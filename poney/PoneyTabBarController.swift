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
    PoneyShop(name: "Poneysher", description: "Hardcore & Gothic poneys", type: "Bar", location: CLLocation(latitude: 48.8965, longitude: 2.318)),
    PoneyShop(name: "Po Po Adventure", description: "Come play with sweet poneys!", type: "Coffee", location: CLLocation(latitude: 49.89671, longitude: 2.81)),
    PoneyShop(name: "Rainbow Poney Club", description: "Come, it's so fun", type: "Night Club", location: CLLocation(latitude: 78.82732, longitude: 42.34334431)),
    PoneyShop(name: "Hell of a Poney", description: "Dare to touch?", type: "Night Club", location: CLLocation(latitude: 56.637631, longitude: 8.9838)),
    PoneyShop(name: "Unicorn strip bar", description: "Come baby", type: "Bar", location: CLLocation(latitude: 39.89661, longitude: 2.71)),
    PoneyShop(name: "Ooops you touch my tralala", description: "Sweet Jesus!", type: "Coffee", location: CLLocation(latitude: 64.81762726, longitude: 7.7262762)),
    PoneyShop(name: "Poney unchained", description: "Do you believe that?", type: "Bar", location: CLLocation(latitude: 29.4361, longitude: 10.31)),
    PoneyShop(name: "I poney myself tonight", description: "Deadpool wins", type: "Night Club", location: CLLocation(latitude: 21.4361, longitude: 10.31)),
    PoneyShop(name: "Noooooooooo", description: "Your father is a poney", type: "Bar", location: CLLocation(latitude: 29.4361, longitude: 76.8727)),
    PoneyShop(name: "Poney trip", description: "Travel around thank too your best friend", type: "Coffee", location: CLLocation(latitude: 53.8738732, longitude: 10.31)),
    PoneyShop(name: "Who is the strongest ?", description: "Poney vs. rhinoceros", type: "Night Club", location: CLLocation(latitude: 53.8738732, longitude: 71.8872872)),
    PoneyShop(name: "P O N E Y", description: "We'll rule!", type: "Coffee", location: CLLocation(latitude: 91.8989, longitude: 71.8872872)),
    PoneyShop(name: "YENOP", description: "!elur ll'eW", type: "Coffee", location: CLLocation(latitude: 91.8989, longitude: 98.8726276)),
    PoneyShop(name: "Satisfaction", description: "Here, you are satisfied", type: "Bar", location: CLLocation(latitude: 67.82625379, longitude: 98.8726276)),
    PoneyShop(name: "Jumbo", description: "He's a decent elephant", type: "Bar", location: CLLocation(latitude: 67.82625379, longitude: 12.8251222)),
    PoneyShop(name: "Nobody", description: "Will know, so tell us!", type: "Bar", location: CLLocation(latitude: 67.82625379, longitude: 73.913496936)),
  ]
}
