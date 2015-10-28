//
//  Weather.swift
//  Weather
//
//  Created by Jay Maloney on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class Weather {
    //description, temp in kelvin, city name, temp in celcius, main
    
    //keys
    static let weatherKey = "weather"
    static let descriptionKey = "description"
    static let temperatureKey = "temp"
    static let nameKey = "name"
    static let mainKey = "main"
    static let iconStringKey = "icon"
    
    var description: String = ""
    var temperatureK: Float?
    var temperatureC: Float {
        return (temperatureK! - 32) * (5 / 9)
    }
    var cityName: String = ""
    var main: String = ""
    var iconString: String = ""
    
    init(jsonDictionary: [String:AnyObject]) {
        
        if let weatherArray = jsonDictionary[Weather.weatherKey] as? [[String: AnyObject]] {
            if let main = weatherArray[0][Weather.mainKey] as? String {
                self.main = main
            }
            
            if let description = weatherArray[0][Weather.descriptionKey] as? String {
                self.description = description
            }
            
            if let icon = weatherArray[0][Weather.iconStringKey] as? String {
                self.iconString = icon
            }
        }
        
        if let mainDictionary = jsonDictionary[Weather.mainKey] as? [String: AnyObject] {
            if let temperatureK = mainDictionary[Weather.temperatureKey] as? Float {
                self.temperatureK = temperatureK
            }
        }
        
        if let name = jsonDictionary[Weather.nameKey] as? String {
            self.cityName = name
        }
    }
}
