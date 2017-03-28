//
//  Forecast.swift
//  weather_x8
//
//  Created by Saumya Raval on 3/27/17.
//  Copyright © 2017 ImbaGames. All rights reserved.
//

import Foundation
import Alamofire

class Forecast {
    
    private var _f_highTemp: String!
    private var _f_lowTemp: String!
    private var _f_dayOfWeek: String!
    private var _f_weatherType: String!

    var f_highTemp: String {
        if _f_highTemp == nil {
            _f_highTemp = ""
        }
        return _f_highTemp
    }
    
    var f_lowTemp: String {
        if _f_lowTemp == nil {
            _f_lowTemp = ""
        }
        return _f_lowTemp
    }
    
    var f_dayOfWeek: String {
        if _f_dayOfWeek == nil {
            _f_dayOfWeek = ""
        }
        return _f_dayOfWeek
    }
    
    var f_weatherType: String {
        if _f_weatherType == nil {
            _f_weatherType = ""
        }
        return _f_weatherType
    }
    
    init(weahterDict: Dictionary<String, AnyObject>) {
        
        if let dt = weahterDict["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: dt)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.timeStyle = .none
            dateFormatter.dateFormat = "EEEE"
            self._f_dayOfWeek = unixConvertedDate.dayOfTheWeek()
        }
        
        if let temp = weahterDict["temp"] as? Dictionary<String,AnyObject> {
            if let highTemp = temp["max"] as? Double {
                print(highTemp)
                self._f_highTemp = "\(Double(round(10 * highTemp)/10))"
            }
            
            if let lowTemp = temp["min"] as? Double {
                print("low: \(lowTemp)")
                self._f_lowTemp = "\(round(10 * lowTemp)/10)"
            }
        }
        
        if let weather = weahterDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let type = weather[0]["main"] as? String {
                self._f_weatherType = type
            }
        }
        
    }
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
