//
//  PoneyListViewController.swift
//  poney
//
//  Created by Alain DEMENET on 2/13/16.
//  Copyright © 2016 Alain DEMENET. All rights reserved.
//

import UIKit

struct Poney {
  var name: String
  var description: String

  init(name: String, description: String) {
    self.name = name
    self.description = description
  }
}

class PoneyListViewController: UITableViewController {

  var poneys = [Poney]()

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    let poney1 = Poney(name: "bob", description: "joly")
    let poney2 = Poney(name: "alain", description: "moche")
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

}
