//
//  WeatherViewController.swift
//  Weather
//
//  Created by Jay Maloney on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UISearchBarDelegate {

    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var tempCLabel: UILabel!
    @IBOutlet var tempFLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print( NetworkController.searchURL("30064"))

        }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        if let searchText = searchBar.text {
            WeatherController.zipCodeSearch(searchText, completion: { (result) in
                
                guard let weatherResult = result else {return}
                
                dispatch_async(dispatch_get_main_queue()) {() in
                    self.nameLabel.text = weatherResult.cityName
                    if let temperatureK = weatherResult.temperatureK {
                        self.tempFLabel.text = String(temperatureK) + " F"
                    } else {
                        self.tempFLabel.text = "There is no temperature."
                    }
                    self.descriptionLabel.text = weatherResult.description
                }//dispatch
                
            })//completion
        }//if let searchtext exists
        
    }//searchBarSearchButtonClicked

}//class
