//
//  RainbowViewController.swift
//  poney
//
//  Created by Yoann Cribier on 14/02/16.
//  Copyright © 2016 Alain DEMENET. All rights reserved.
//

import UIKit

class RainbowViewController: UIViewController {

  @IBOutlet weak var rhinoImage: UIImageView!
  @IBOutlet weak var heartImage: UIImageView!

  @IBAction func rainbowSwitch(sender: UISwitch) {
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setBool(sender.on, forKey: "rainbowMode")

    if sender.on {
      startRainbow(index: 0)
      rhinoImage.hidden = false
      heartImage.hidden = false
    }
    else {
      stopRainbow()
      rhinoImage.hidden = true
      heartImage.hidden = true
    }
  }

  override func viewDidLoad() {
    rhinoImage.hidden = true
    heartImage.hidden = true
  }

  var cancelDispatch = false

  let pinkColor = UIColor(hexString: "#EEA6C8")

  func startRainbow(index index: Int) {
    let colors = [
      UIColor.redColor(),
      UIColor.magentaColor(),
      UIColor.purpleColor(),
      UIColor.blueColor(),
      UIColor.greenColor(),
      UIColor.yellowColor(),
      UIColor.orangeColor(),
      UIColor.brownColor(),
      UIColor.blackColor(),
    ]

    if cancelDispatch {
      cancelDispatch = false
      return
    }

    let index = index % colors.count
    self.view.backgroundColor = colors[index]

    let seconds = 0.1
    let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
    dispatch_after(delay, dispatch_get_main_queue(), {
      self.startRainbow(index: index + 1)
      }
    )
  }

  func stopRainbow() {
    cancelDispatch = true
    self.view.backgroundColor = UIColor.whiteColor()
  }

}
