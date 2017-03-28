//
//  WeatherVC.swift
//  weather_x8
//
//  Created by Saumya Raval on 3/23/17.
//  Copyright © 2017 ImbaGames. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class WeatherVC: UIViewController, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var todayDate: UILabel!
    @IBOutlet weak var mainTemp: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var weatherThumbImg: UIImageView!
    
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather: CurrentWeather!
    
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
        currentWeather = CurrentWeather()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        locationAuthStatus()
    }
    
    func locationAuthStatus() {         //Don't forget to call the function
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManager.location
            Location.sharedInstace.latitude = currentLocation.coordinate.latitude
            Location.sharedInstace.longitude = currentLocation.coordinate.longitude
            print(Location.sharedInstace.latitude, Location.sharedInstace.longitude)
            currentWeather.downloadCurrentWeather {
                // Update UI here
                self.downloadForecastWeather {
                    self.updateUI()
                }
            }
            
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }
    
    func downloadForecastWeather(completed: @escaping downloadComplete) {
        
        Alamofire.request(FORECAST_WEATHER_URL).responseJSON { response in
            if let dict = response.value as? Dictionary<String, AnyObject> {
                if let list = dict["list"] as? [Dictionary<String,AnyObject>] {
                    for obj in list {
                        let forecast = Forecast(weahterDict: obj)
                        self.forecasts.append(forecast)
                    }
                    self.forecasts.remove(at: 0)
                    self.tableView.reloadData()
                }
            }
            completed()
        }
    }
    
    
    func updateUI() {
        todayDate.text = currentWeather.date
        mainTemp.text = "\(currentWeather.currentTemp) °F"
        location.text = currentWeather.cityName
        weatherType.text = currentWeather.weatherType
        weatherThumbImg.image = UIImage(named: "\(currentWeather.weatherType)")
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as?  WeatherCell {
            let forecast = forecasts[indexPath.row]
            cell.configureCell(cell: forecast)
            return cell
        } else {
            return WeatherCell()
        }
    }
}

