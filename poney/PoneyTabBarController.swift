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
    PoneyShop(name: "Poneysher", description: "Hardcore & Gothic poneys", type: .Shop, location: CLLocation(latitude: 48.8965, longitude: 2.318)),
    PoneyShop(name: "Po Po Adventure", description: "Come play with sweet poneys!", type: .Park, location: CLLocation(latitude: 49.89671, longitude: 2.81)),
    PoneyShop(name: "Rainbow Poney Club", description: "Come, it's so fun", type: .NightClub, location: CLLocation(latitude: 48.8890, longitude: 2.3160)),
    PoneyShop(name: "Hell of a Poney", description: "Dare to touch?", type: .NightClub, location: CLLocation(latitude: 48.8833, longitude: 2.2988)),
    PoneyShop(name: "Unicorn strip bar", description: "Come baby", type: .Bar, location: CLLocation(latitude: 48.8935, longitude: 2.3301)),
    PoneyShop(name: "Ooops you touch my tralala", description: "Sweet Jesus!", type: .Coffee, location: CLLocation(latitude: 48.8952, longitude: 2.3184)),
    PoneyShop(name: "Poney unchained", description: "Do you believe that?", type: .Bar, location: CLLocation(latitude: 48.8876, longitude: 2.3408)),
    PoneyShop(name: "I poney myself tonight", description: "Deadpool wins", type: .NightClub, location: CLLocation(latitude: 48.8739, longitude: 2.3505)),
    PoneyShop(name: "Noooooooooo", description: "Your father is a poney", type: .Bar, location: CLLocation(latitude: 48.8543, longitude: 2.3199)),
    PoneyShop(name: "Poney trip", description: "Travel around thank too your best friend", type: .Coffee, location: CLLocation(latitude: 48.8420, longitude: 2.2908)),
    PoneyShop(name: "Who is the strongest ?", description: "Poney vs. rhinoceros", type: .NightClub, location: CLLocation(latitude: 48.8333, longitude: 2.3662)),
    PoneyShop(name: "P O N E Y", description: "We'll rule!", type: .Coffee, location: CLLocation(latitude: 48.8517, longitude: 2.3826)),
    PoneyShop(name: "YENOP", description: "!elur ll'eW", type: .Coffee, location: CLLocation(latitude: 48.8708, longitude: 2.383)),
    PoneyShop(name: "Satisfaction", description: "Here, you are satisfied", type: .Bar, location: CLLocation(latitude: 48.8779, longitude: 2.3300)),
    PoneyShop(name: "Jumbo", description: "He's a decent elephant", type: .Shop, location: CLLocation(latitude: 48.8634, longitude: 2.2891)),
    PoneyShop(name: "Nobody", description: "Will know, so tell us!", type: .Bar, location: CLLocation(latitude: 48.8557, longitude: 2.2927)),
  ]
}
