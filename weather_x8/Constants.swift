//
//  Constants.swift
//  weather_x8
//
//  Created by Saumya Raval on 3/23/17.
//  Copyright © 2017 ImbaGames. All rights reserved.
//

import Foundation

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstace.latitude!)&lon=\(Location.sharedInstace.longitude!)&appid=ec2dc494e6bd38f3049c1562844bd818&units=imperial"

typealias downloadComplete = () -> ()

let FORECAST_WEATHER_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstace.latitude!)&lon=\(Location.sharedInstace.longitude!)&cnt=10&units=imperial&appid=ec2dc494e6bd38f3049c1562844bd818"

//  api.openweathermap.org/data/2.5/weather?lat=35&lon=139&units=imperial&appid=b1b15e88fa797225412429c1c50c122a1

//  http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=ec2dc494e6bd38f3049c1562844bd818&units=imperial


// api.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=10&units=imperial&appid=ec2dc494e6bd38f3049c1562844bd818
