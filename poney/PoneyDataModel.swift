//
//  PoneyDataModel.swift
//  poney
//
//  Created by Yoann CRIBIER on 2/13/16.
//  Copyright © 2016 Alain DEMENET. All rights reserved.
//

import Foundation
import MapKit

enum PoneyShopType {
  case NightClub
  case Bar
  case Coffee
  case Park
  case Shop

  case Count
}

struct PoneyShop {
  var name: String
  var description: String
  var type: PoneyShopType
  var location: CLLocation

  init(name: String, description: String, type: PoneyShopType, location: CLLocation) {
    self.name = name
    self.description = description
    self.type = type
    self.location = location
  }
  
}