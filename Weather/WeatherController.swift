//
//  WeatherController.swift
//  Weather
//
//  Created by Jay Maloney on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class WeatherController {
    
    static let sharedInstance = WeatherController()
    
    static func zipCodeSearch(url: String, completion: (result: Weather?) -> Void) {
        
        let urlString = NetworkController.searchURL(url)
        
        NetworkController.dataAtURL(urlString) { (resultData) -> Void in
        
            
            guard let resultData = resultData else {
                print("Error, data not received.")
                completion(result: nil)
                return
            }
            //if guard doesnt fail, do the following
            do {
                let weatherAnyObject = try NSJSONSerialization.JSONObjectWithData(resultData, options: NSJSONReadingOptions.AllowFragments)
                
                var weather: Weather?
                
                if let weatherDictionary = weatherAnyObject as? [String: AnyObject] {
                    weather = Weather(jsonDictionary: weatherDictionary)
                }
                completion(result: weather)
                
            } catch {
                completion(result: nil)
                }//catch
            
            
        
        }//urlstring
        
    }//zipcodesearc
}//class




    
