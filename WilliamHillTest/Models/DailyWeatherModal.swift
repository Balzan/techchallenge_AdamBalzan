//
//  DailyWeatherModal.swift
//  WilliamHillTest
//
//  Created by Adam Balzan on 24/10/17.
//  Copyright © 2017 Adam Balzan. All rights reserved.
//

import Foundation
class DailyWeatherModal {
    
    let apparentTemperatureHigh :Double
    let apparentTemperatureHighTime :Date?
    let apparentTemperatureLow :Double
    let apparentTemperatureLowTime :Date?
    let apparentTemperatureMax :Double
    let apparentTemperatureMaxTime :Date?
    let apparentTemperatureMin :Double
    let apparentTemperatureMinTime :Date?
    let cloudCover :Double
    let dewPoint :Double
    let humidity :Double
    let icon :String
    let moonPhase :Double
    let ozone :Double
    let precipIntensity :Double
    let precipIntensityMax :Double
    let precipIntensityMaxTime :Date?
    let precipProbability :Double
    let precipType :String
    let pressure :Double
    let summary :String
    let sunriseTime :Date?
    let sunsetTime :Date?
    let temperatureHigh :Double
    let temperatureHighTime :Date?
    let temperatureLow :Double
    let temperatureLowTime :Date?
    let temperatureMax :Double
    let temperatureMaxTime :Date?
    let temperatureMin :Double
    let temperatureMinTime :Date?
    let time :Date?
    let uvIndex :Double
    let uvIndexTime :Date?
    let windBearing :Double
    let windGust :Double
    let windGustTime :Date?
    let windSpeed :Double
    
    init(json: [String:Any]){

        self.apparentTemperatureHigh = json["apparentTemperatureHigh"] as? Double ?? 0.0
        self.apparentTemperatureHighTime = DailyWeatherModal.parseDateTime(item: json["apparentTemperatureHighTime"])
        self.apparentTemperatureLow = json["apparentTemperatureLow"] as? Double ?? 0.0
        self.apparentTemperatureLowTime = DailyWeatherModal.parseDateTime(item: json["apparentTemperatureLowTime"])
        self.apparentTemperatureMax = json["apparentTemperatureMax"] as? Double ?? 0.0
        self.apparentTemperatureMaxTime = DailyWeatherModal.parseDateTime(item:json["apparentTemperatureMaxTime"] )
        self.apparentTemperatureMin = json["apparentTemperatureMin"] as? Double ?? 0.0
        self.apparentTemperatureMinTime = DailyWeatherModal.parseDateTime(item:json["apparentTemperatureMinTime"] )
        self.cloudCover = json["cloudCover"] as? Double ?? 0.0
        self.dewPoint = json["dewPoint"] as? Double ?? 0.0
        self.humidity = json["humidity"] as? Double ?? 0.0
        self.icon = json["icon"] as? String ?? ""
        self.moonPhase = json["moonPhase"] as? Double ?? 0.0
        self.ozone = json["ozone"] as? Double ?? 0.0
        self.precipIntensity = json["precipIntensity"] as? Double ?? 0.0
        self.precipIntensityMax = json["precipIntensityMax"] as? Double ?? 0.0
        self.precipIntensityMaxTime = DailyWeatherModal.parseDateTime(item:json["precipIntensityMaxTime"] )
        self.precipProbability = json["precipProbability"] as? Double ?? 0.0
        self.precipType = json["precipType"] as? String ?? ""
        self.pressure = json["pressure"] as? Double ?? 0.0
        self.summary = json["summary"] as? String ?? ""
        self.sunriseTime = DailyWeatherModal.parseDateTime(item:json["sunriseTime"] )
        self.sunsetTime = DailyWeatherModal.parseDateTime(item:json["sunsetTime"] )
        self.temperatureHigh = json["temperatureHigh"] as? Double ?? 0.0
        self.temperatureHighTime = DailyWeatherModal.parseDateTime(item:json["temperatureHighTime"] )
        self.temperatureLow = json["temperatureLow"] as? Double ?? 0.0
        self.temperatureLowTime = DailyWeatherModal.parseDateTime(item:json["temperatureLowTime"] )
        self.temperatureMax = json["temperatureMax"] as? Double ?? 0.0
        self.temperatureMaxTime = DailyWeatherModal.parseDateTime(item:json["temperatureMaxTime"] )
        self.temperatureMin = json["temperatureMin"] as? Double ?? 0.0
        self.temperatureMinTime = DailyWeatherModal.parseDateTime(item:json["temperatureMinTime"] )
        self.uvIndex = json["uvIndex"] as? Double ?? 0.0
        self.uvIndexTime = DailyWeatherModal.parseDateTime(item:json["uvIndexTime"] )
        self.windBearing = json["windBearing"] as? Double ?? 0.0
        self.windGust = json["windGust"] as? Double ?? 0.0
        self.windGustTime = DailyWeatherModal.parseDateTime(item:json["windGustTime"] )
        self.windSpeed = json["windSpeed"] as? Double ?? 0.0
        
        if let timeInterval = json["time"] as? Double {
            self.time = Date.init(timeIntervalSince1970: timeInterval)
        }
        else{
            self.time = nil
        }
    }
    
    func displayTemperatureAsCelsius() -> String {
        let maxString = "\(Int(5.0 / 9.0 * (self.temperatureMax - 32.0)))°"
        let minString = "\(Int(5.0 / 9.0 * (self.temperatureMin - 32.0)))°"
        return "\(minString) - \(maxString)"
    }
    
    class func parseDateTime(item:Any?) -> Date? {
        if let timeInterval = item as? Double {
            return Date.init(timeIntervalSince1970: timeInterval)
        }
        return nil
    }
}


