//
//  ViewController.swift
//  weatherApp
//
//  Created by marvin evins on 5/28/20.
//  Copyright © 2020 websavantmedia. All rights reserved.
//

import UIKit

class LocationListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var editBarButton: UIBarButtonItem!
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    

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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            weatherLocations.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = weatherLocations[sourceIndexPath.row]
        weatherLocations.remove(at: sourceIndexPath.row)
       weatherLocations.insert(itemToMove, at: destinationIndexPath.row)
        
    }

    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        
        if tableView.isEditing{
            tableView.setEditing(false, animated: true)
            sender.title = "Edit"
            addBarButton.isEnabled = true
        }else{
            tableView.setEditing(true, animated: true)
            sender.title = "Done"
            addBarButton.isEnabled = false
        }
        
    }
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        
    }
}

