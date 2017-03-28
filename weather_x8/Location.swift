//
//  Location.swift
//  weather_x8
//
//  Created by Saumya Raval on 3/27/17.
//  Copyright © 2017 ImbaGames. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
    static var sharedInstace = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
