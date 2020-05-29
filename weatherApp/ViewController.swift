//
//  ViewController.swift
//  weatherApp
//
//  Created by marvin evins on 5/28/20.
//  Copyright © 2020 websavantmedia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    

    @IBOutlet weak var tableView: UITableView!
    
    var weatherLocations: [WeatherLocation] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var weatherLocation = WeatherLocation(name: "Chicago, IL", latitude: 0, longitude:  0)
        weatherLocations.append(weatherLocation)
        weatherLocation = WeatherLocation(name: "ChestnutHill, Malawi", latitude: 0, longitude: 0)
        weatherLocations.append(weatherLocation)
        weatherLocation = WeatherLocation(name: "ChestnutHill, Malawi", latitude: 0, longitude: 0)
        weatherLocations.append(weatherLocation)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherLocations.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = weatherLocations[indexPath.row].name
        return cell
      }

}

