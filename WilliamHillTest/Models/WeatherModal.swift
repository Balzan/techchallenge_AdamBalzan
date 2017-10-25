//
//  WeatherModal.swift
//  WilliamHillTest
//
//  Created by Adam Balzan on 24/10/17.
//  Copyright © 2017 Adam Balzan. All rights reserved.
//

import Foundation
class WeatherModal {
    
    let apparentTemperature : Double
    let cloudCover : Double
    let dewPoint : Double
    let humidity : Double
    let icon : String
    let ozone : Double
    let precipIntensity : Double
    let precipProbability : Double
    let pressure : Double
    let summary : String
    let temperature : Double
    let time : Date?
    let uvIndex : Double
    let visibility : Double
    let windBearing : Double
    let windGust : Double
    let windSpeed : Double
    
    init(json: [String:Any]){
        
        self.apparentTemperature = json["apparentTemperature"] as? Double ?? 0.0
        self.cloudCover = json["cloudCover"] as? Double ?? 0.0
        self.dewPoint = json["dewPoint"] as? Double ?? 0.0
        self.humidity = json["humidity"] as? Double ?? 0.0
        self.icon = json["icon"] as? String ?? ""
        self.ozone = json["ozone"] as? Double ?? 0.0
        self.precipIntensity = json["precipIntensity"] as? Double ?? 0.0
        self.precipProbability = json["precipProbability"] as? Double ?? 0.0
        self.pressure = json["pressure"] as? Double ?? 0.0
        self.summary = json["summary"] as? String ?? ""
        self.temperature = json["temperature"] as? Double ?? 0.0
        self.time = WeatherModal.parseDateTime(item:json["time"])
        self.uvIndex = json["uvIndex"] as? Double ?? 0.0
        self.visibility = json["visibility"] as? Double ?? 0.0
        self.windBearing = json["windBearing"] as? Double ?? 0.0
        self.windGust = json["windGust"] as? Double ?? 0.0
        self.windSpeed = json["windSpeed"] as? Double ?? 0.0
    }
    
    func displayTemperatureAsCelsius() -> String {
        return "\(Int(5.0 / 9.0 * (self.temperature - 32.0)))°"
    }
    
    class func parseDateTime(item:Any?) -> Date? {
        if let timeInterval = item as? Double {
            return Date.init(timeIntervalSince1970: timeInterval)
        }
        return nil
    }
}


