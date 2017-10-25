//
//  WilliamHillTestTests.swift
//  WilliamHillTestTests
//
//  Created by Adam Balzan on 24/10/17.
//  Copyright © 2017 Adam Balzan. All rights reserved.
//

import XCTest
@testable import WilliamHillTest

class WilliamHillTestTests: XCTestCase {

    var current :WeatherModal?
    var hourlyItems = [WeatherModal]()
    var firstHourly :WeatherModal?
    var lastHourly :WeatherModal?
    var dailyItems = [DailyWeatherModal]()
    var firstDaily :DailyWeatherModal?
    var lastDaily :DailyWeatherModal?
    
    override func setUp() {
        super.setUp()
   
        let testBundle = Bundle(for: type(of: self))
        if  let url = testBundle.url(forResource: "staticData", withExtension: "json") {
            do {
                
             let data = try Data(contentsOf: url, options: .alwaysMapped)
                
                if let dic = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject] {
                    
                    if let currentDic = dic["currently"] as? [String:Any] {
                        current = WeatherModal.init(json: currentDic)
                    }
                    
                    if let hourlyData = dic["hourly"] as? [String:Any]{
                        if let hourlyDataArray = hourlyData["data"] as? [[String:Any]] {
                            for hourly in hourlyDataArray {
                                hourlyItems.append(WeatherModal.init(json: hourly))
                            }
                        }
                    }
                    firstHourly = hourlyItems.first
                    lastHourly = hourlyItems.last
                    
                    if let dailyData = dic["daily"] as? [String:Any]{
                        if let dailyDataArray = dailyData["data"] as? [[String:Any]] {
                            for daily in dailyDataArray {
                                dailyItems.append(DailyWeatherModal.init(json: daily))
                            }
                        }
                    }
                    firstDaily = dailyItems.first
                    lastDaily = dailyItems.last
                    
                }

            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path. \(testBundle.bundlePath)")
        }
    }
    
    func testCurrent(){
        XCTAssertEqual(current?.apparentTemperature, 73.47)
        XCTAssertEqual(current?.icon, "cloudy")
        XCTAssertEqual(current?.pressure, 1011.3)
        XCTAssertEqual(current?.summary, "Overcast")
        XCTAssertEqual(current?.windGust, 2.44)
        XCTAssertEqual(current?.windSpeed, 3.26)
        XCTAssertEqual(current?.ozone, 327.01)
    }
    
    func testHourlyItems(){
        XCTAssertEqual(hourlyItems.count, 49)
        XCTAssertNotNil(firstHourly)
        XCTAssertNotNil(lastHourly)
        XCTAssertNotEqual(firstHourly?.apparentTemperature, lastHourly?.apparentTemperature)
    }

    func testFirstHourlyItem(){
        XCTAssertEqual(firstHourly?.apparentTemperature, 73.85)
        XCTAssertEqual(firstHourly?.icon, "cloudy")
        XCTAssertEqual(firstHourly?.pressure, 1011.29)
        XCTAssertEqual(firstHourly?.summary, "Overcast")
        XCTAssertEqual(firstHourly?.windGust, 2.29)
        XCTAssertEqual(firstHourly?.windSpeed, 3.24)
        XCTAssertEqual(firstHourly?.ozone, 326.95)
    }

    func testLastHourlyItem(){
        XCTAssertEqual(lastHourly?.apparentTemperature, 63.54)
        XCTAssertEqual(lastHourly?.icon, "clear-night")
        XCTAssertEqual(lastHourly?.pressure, 1011.23)
        XCTAssertEqual(lastHourly?.summary, "Clear")
        XCTAssertEqual(lastHourly?.windGust, 14.18)
        XCTAssertEqual(lastHourly?.windSpeed, 7.84)
        XCTAssertEqual(lastHourly?.ozone, 316.61)
    }

    func testDailyItems() {
        XCTAssertEqual(dailyItems.count, 8)
        XCTAssertNotNil(firstDaily)
        XCTAssertNotNil(lastDaily)
        XCTAssertNotEqual(firstDaily?.apparentTemperatureMax, lastDaily?.apparentTemperatureMax)
    }
    
    func testFirstDailyItem(){
        XCTAssertEqual(firstDaily?.apparentTemperatureHigh, 86.77)
        XCTAssertEqual(firstDaily?.icon, "partly-cloudy-day")
        XCTAssertEqual(firstDaily?.summary, "Mostly cloudy throughout the day.")
        XCTAssertEqual(firstDaily?.temperatureMax, 86.77)
        XCTAssertEqual(firstDaily?.uvIndex, 9)
        XCTAssertEqual(firstDaily?.windSpeed, 0.31)
        XCTAssertEqual(firstDaily?.windGust, 9.09)
    }

    func testLastDailyItem(){
        XCTAssertEqual(lastDaily?.apparentTemperatureHigh, 67.82)
        XCTAssertEqual(lastDaily?.icon, "wind")
        XCTAssertEqual(lastDaily?.summary, "Breezy in the morning and mostly cloudy throughout the day.")
        XCTAssertEqual(lastDaily?.temperatureMax, 67.82)
        XCTAssertEqual(lastDaily?.uvIndex, 7)
        XCTAssertEqual(lastDaily?.windSpeed, 16.86)
        XCTAssertEqual(lastDaily?.windGust, 30.02)
    }

    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
