//
//  WeatherCell.swift
//  weather_x8
//
//  Created by Saumya Raval on 3/27/17.
//  Copyright © 2017 ImbaGames. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var highTempLbl: UILabel!
    @IBOutlet weak var lowTempLbl: UILabel!
    @IBOutlet weak var dayOfWeekLbl: UILabel!
    @IBOutlet weak var weatherTypeLbl: UILabel!
    @IBOutlet weak var weatherImg: UIImageView!
    
    func configureCell(cell: Forecast) {
        highTempLbl.text = "\(cell.f_highTemp)°"
        lowTempLbl.text = "\(cell.f_lowTemp)°"
        dayOfWeekLbl.text = cell.f_dayOfWeek
        weatherTypeLbl.text = cell.f_weatherType
        weatherImg.image = UIImage(named: "\(cell.f_weatherType)")
    }
    
    
}
