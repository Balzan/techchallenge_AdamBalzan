//
//  DarkSkyDataRequest.swift
//  WilliamHillTest
//
//  Created by Adam Balzan on 24/10/17.
//  Copyright © 2017 Adam Balzan. All rights reserved.
//
import Foundation

class DarkSkyDataRequest {
    
    let baseAPIURL = "https://api.darksky.net/"
    let userAPIKey = "c67f9a35b40fbe7263b487d8fe5a9fac"
    let defaultLongitudeString = "151.2094"
    let defaultLatitudeString = "-33.8650"
    
    func getCurrentWeather(completion:@escaping (_ result: WeatherModal?) -> Void){
        let url = URL(string: "\(baseAPIURL)forecast/\(userAPIKey)/\(defaultLatitudeString),\(defaultLongitudeString)")
        let request = NSMutableURLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 20.0)
        request.httpMethod = "GET"
        var currentWeather :WeatherModal?
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            }
            if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                do {
                    if let dic = try JSONSerialization.jsonObject(with: data!) as? [String : Any] {
                        if let currentDic = dic["currently"] as? [String:Any] {
                            currentWeather = WeatherModal.init(json: currentDic)
                        }
                    }
                } catch let error as NSError {
                    print(error)
                }
                
            }
            completion(currentWeather)
        })
        dataTask.resume()
    }
   
    func getHourlyWeatherFeed(completion:@escaping (_ result: [WeatherModal]) -> Void){
        let url = URL(string: "\(baseAPIURL)forecast/\(userAPIKey)/\(defaultLatitudeString),\(defaultLongitudeString)")
        let request = NSMutableURLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 20.0)
        request.httpMethod = "GET"
        
        var hourlyArray = [WeatherModal]()
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            }
            if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                do {
                    if let dic = try JSONSerialization.jsonObject(with: data!) as? [String : Any] {
                        if let hourlyData = dic["hourly"] as? [String:Any]{
                            if let hourlyDataArray = hourlyData["data"] as? [[String:Any]] {
                                for hourly in hourlyDataArray {
                                    hourlyArray.append(WeatherModal.init(json: hourly))
                                }
                            }
                        }
                    }
                } catch let error as NSError {
                    print(error)
                }
            }
            completion(hourlyArray)
        })
        dataTask.resume()
    }
  
    func getDailyWeatherFeed(completion:@escaping (_ result: [DailyWeatherModal]) -> Void){
        let url = URL(string: "\(baseAPIURL)forecast/\(userAPIKey)/\(defaultLatitudeString),\(defaultLongitudeString)")
        let request = NSMutableURLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 20.0)
        request.httpMethod = "GET"
        
        var dailyArray = [DailyWeatherModal]()
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            }
            if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                do {
                    if let dic = try JSONSerialization.jsonObject(with: data!) as? [String : Any] {
                        if let dailyData = dic["daily"] as? [String:Any]{
                            if let dailyDataArray = dailyData["data"] as? [[String:Any]] {
                                for daily in dailyDataArray {
                                    dailyArray.append(DailyWeatherModal.init(json: daily))
                                }
                            }
                        }
                    }
                } catch let error as NSError {
                    print(error)
                }
            }
            completion(dailyArray)
        })
        dataTask.resume()
    }
    
}


