//
//  ViewController.swift
//  PlistDemo
//
//  Created by Alex Paul on 2/8/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    readPlist()
  }
  
  private func readPlist() {
    if let path = Bundle.main.path(forResource: "Place", ofType: "plist") {
      if let dict = NSDictionary(contentsOfFile: path) as? Dictionary<String, AnyObject> {
        if let coordStrings = dict["Coordinates"] as? [String] {
          let coordStringArray = coordStrings.map { $0.components(separatedBy: ",") }
          let coordinates = coordStringArray.map { CLLocationCoordinate2DMake(Double($0[0])!, Double($0[1])!) }
          print(coordinates)
        }
        if let pursuitDict = dict["Pursuit"] as? [String: AnyObject] {
          if let name = pursuitDict["Name"] as? String {
            print(name)
          }
          if let lat = pursuitDict["Latitude"] as? Double {
            print(lat)
          }
          if let lon = pursuitDict["Longitude"] as? Double {
            print(lon)
          }
          if let description = pursuitDict["Description"] as? String {
            print(description)
          }
        }
      }
    } else {
      print("no resource found for given path")
    }
  }
}

