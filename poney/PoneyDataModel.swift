//
//  PoneyDataModel.swift
//  poney
//
//  Created by Yoann CRIBIER on 2/13/16.
//  Copyright © 2016 Alain DEMENET. All rights reserved.
//

import Foundation
import MapKit

struct PoneyShop {
  var name: String
  var description: String
  var location: CLLocation

  init(name: String, description: String, location: CLLocation) {
    self.name = name
    self.description = description
    self.location = location
  }
  
}