# Plist-Creating-Reading
Creating a Plist and Reading from it via Bundle.main

**Place.plist File**  

![place plist](https://github.com/alexpaul/Plist-Creating-Reading/blob/master/Images/place-plist.png)   


**Reading from the Place.plist file**   
```swift 
private func readPlist() {
  if let path = Bundle.main.path(forResource: "Place", ofType: "plist") {
    if let dict = NSDictionary(contentsOfFile: path) as? Dictionary<String, AnyObject> {
      if let coordStrings = dict["Coordinates"] as? [String] {
        let coordStringArray = coordStrings.map { $0.components(separatedBy: ",") }
        let coordinates = coordStringArray.map { CLLocationCoordinate2DMake(Double($0[0])!, Double($0[1])!) }
        print(coordinates)
        /*
         [__C.CLLocationCoordinate2D(latitude: 40.7429595, longitude: -73.9441155),
         __C.CLLocationCoordinate2D(latitude: 40.7457885, longitude: -73.8489019)]
        */
      }
      if let pursuitDict = dict["Pursuit"] as? [String: AnyObject] {
        if let name = pursuitDict["Name"] as? String {
          print(name) // Pursuit
        }
        if let lat = pursuitDict["Latitude"] as? Double {
          print(lat) // 40.7429595
        }
        if let lon = pursuitDict["Longitude"] as? Double {
          print(lon) // -73.9441155
        }
        if let description = pursuitDict["Description"] as? String {
          print(description)
          /*
           Pursuit trains adults with the most need and potential to get their first tech jobs, advance in their careers,
           and become the next generation of leaders in tech.
          */
        }
      }
    }
  } else {
    print("no resource found for given path")
  }
}
```
