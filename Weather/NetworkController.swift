//
//  NetworkController.swift
//  Weather
//
//  Created by Jay Maloney on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class NetworkController {
    
    static func searchURL(zipSearch: String) -> NSURL {
        
        let frontURL = "http://api.openweathermap.org/data/2.5/weather?zip="
        let backURL = ",us&appid=c6263635363a2c31e51243eb61fa1e96"
        let finalURL = "\(frontURL)" + "\(zipSearch)" + "\(backURL)"
        
        return NSURL(string: finalURL)!
    }
    
    static func dataAtURL (url: NSURL, completion:(resultData: NSData?) -> Void){
        
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            
            if let error = error {
                print(error.localizedDescription)
            }
            completion(resultData: data)
        }
        
        dataTask.resume()
    }
    
}
