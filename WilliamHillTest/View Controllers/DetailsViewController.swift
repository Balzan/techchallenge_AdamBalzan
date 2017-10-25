//
//  DetailsViewController.swift
//  WilliamHillTest
//
//  Created by Adam Balzan on 24/10/17.
//  Copyright © 2017 Adam Balzan. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.text = ""
        dateFormatter.dateFormat = "MMMM d, YYYY h:mm a"
        
    }

    func configure(weatherModal:WeatherModal){

        self.textView.text = "ApparentTemperature : \(weatherModal.apparentTemperature) \n\nCloudCover : \(weatherModal.cloudCover) \n\nDewPoint : \(weatherModal.dewPoint) \n\nHumidity : \(weatherModal.humidity) \n\nIcon : \(weatherModal.icon) \n\nOzone : \(weatherModal.ozone) \n\nPrecipIntensity : \(weatherModal.precipIntensity) \n\nPrecipProbability : \(weatherModal.precipProbability) \n\nPressure : \(weatherModal.pressure) \n\nSummary : \(weatherModal.summary) \n\nTemperature : \(weatherModal.displayTemperatureAsCelsius()) \n\nTime : \(dateString(item: weatherModal.time) ) \n\nUvIndex : \(weatherModal.uvIndex) \n\nVisibility : \(weatherModal.visibility) \n\nWindBearing : \(weatherModal.windBearing) \n\nWindGust : \(weatherModal.windGust) \n\nWindSpeed : \(weatherModal.windSpeed) "
    }

    func configure(dailyWeatherModal:DailyWeatherModal){
        
        self.textView.text = "ApparentTemperatureHigh: \(dailyWeatherModal.apparentTemperatureHigh) \n\nApparentTemperatureHighTime: \(dateString(item:dailyWeatherModal.apparentTemperatureHighTime)) \n\nApparentTemperatureLow: \(dailyWeatherModal.apparentTemperatureLow) \n\nApparentTemperatureLowTime: \(dateString(item:dailyWeatherModal.apparentTemperatureLowTime)) \n\nApparentTemperatureMax: \(dailyWeatherModal.apparentTemperatureMax) \n\nApparentTemperatureMaxTime: \(dateString(item:dailyWeatherModal.apparentTemperatureMaxTime)) \n\nApparentTemperatureMin: \(dailyWeatherModal.apparentTemperatureMin) \n\nApparentTemperatureMinTime: \(dateString(item:dailyWeatherModal.apparentTemperatureMinTime)) \n\nCloudCover: \(dailyWeatherModal.cloudCover) \n\nDewPoint: \(dailyWeatherModal.dewPoint) \n\nHumidity: \(dailyWeatherModal.humidity) \n\nIcon: \(dailyWeatherModal.icon) \n\nMoonPhase: \(dailyWeatherModal.moonPhase) \n\nOzone: \(dailyWeatherModal.ozone) \n\nPrecipIntensity: \(dailyWeatherModal.precipIntensity) \n\nPrecipIntensityMax: \(dailyWeatherModal.precipIntensityMax) \n\nPrecipIntensityMaxTime: \(dateString(item:dailyWeatherModal.precipIntensityMaxTime)) \n\nPrecipProbability: \(dailyWeatherModal.precipProbability) \n\nPrecipType: \(dailyWeatherModal.precipType) \n\nPressure: \(dailyWeatherModal.pressure) \n\nSummary: \(dailyWeatherModal.summary) \n\nSunriseTime: \(dateString(item:dailyWeatherModal.sunriseTime)) \n\nSunsetTime: \(dateString(item:dailyWeatherModal.sunsetTime)) \n\nTemperatureHigh: \(dailyWeatherModal.temperatureHigh) \n\nTemperatureHighTime: \(dateString(item:dailyWeatherModal.temperatureHighTime)) \n\nTemperatureLow: \(dailyWeatherModal.temperatureLow) \n\nTemperatureLowTime: \(dateString(item:dailyWeatherModal.temperatureLowTime)) \n\nTemperatureMax: \(dailyWeatherModal.temperatureMax) \n\nTemperatureMaxTime: \(dateString(item:dailyWeatherModal.temperatureMaxTime)) \n\nTemperatureMin: \(dailyWeatherModal.temperatureMin) \n\nTemperatureMinTime: \(dateString(item:dailyWeatherModal.temperatureMinTime)) \n\nTime: \(dateString(item:dailyWeatherModal.time)) \n\n UvIndex: \(dailyWeatherModal.uvIndex) \n\nUvIndexTime: \(dateString(item:dailyWeatherModal.uvIndexTime)) \n\nWindBearing: \(dailyWeatherModal.windBearing) \n\nWindGust: \(dailyWeatherModal.windGust) \n\nWindGustTime: \(dateString(item:dailyWeatherModal.windGustTime)) \n\nWindSpeed: \(dailyWeatherModal.windSpeed) "
    }
    
    func dateString(item:Date?) -> String{
        if let date = item{
            return dateFormatter.string(from: date)
        }
        return ""
        
    }

}
