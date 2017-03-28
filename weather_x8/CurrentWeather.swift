//
//  CurrentWeather.swift
//  weather_x8
//
//  Created by Saumya Raval on 3/23/17.
//  Copyright © 2017 ImbaGames. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeather {
    
    private var _date: String!
    private var _currentTemp: String!
    private var _cityName: String!
    private var _weatherType: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var currentTemp: String {
        if _currentTemp == nil {
            _currentTemp = ""
        }
        return _currentTemp
    }
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    func downloadCurrentWeather(completed: @escaping downloadComplete) {
        
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            //print(response)
            
            if let dict = response.value as? Dictionary<String, AnyObject> {
                if let name = dict["name"] as? String {
                    self._cityName = name
                    print(self.cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main
                        print(self.weatherType)
                    }
                }
                
                if let tempDict = dict["main"] as? Dictionary<String, AnyObject> {
                    if let temp = tempDict["temp"] as? Int {
                        self._currentTemp = "\(temp)"
                        print(self.currentTemp)
                    }
                }
            }
            completed()
        }
    }
}
