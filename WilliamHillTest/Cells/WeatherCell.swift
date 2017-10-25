//
//  WeatherCell.swift
//  WilliamHillTest
//
//  Created by Adam Balzan on 24/10/17.
//  Copyright © 2017 Adam Balzan. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    func setupCell(item:WeatherModal, dateFormatter:DateFormatter){
        self.temperatureLabel.text = item.displayTemperatureAsCelsius()
        self.timeLabel.text = ""
        if let datetime = item.time{
            self.timeLabel.text = dateFormatter.string(from: datetime)
        }
        self.iconImageView.image = UIImage(named:"\(item.icon).png")
        self.summaryLabel.text = item.summary
    }
    
    func setupDailyCell(item:DailyWeatherModal, dateFormatter:DateFormatter){
        self.temperatureLabel.text = item.displayTemperatureAsCelsius()
        self.timeLabel.text = ""
        if let datetime = item.time{
            self.timeLabel.text = dateFormatter.string(from: datetime)
        }
        self.iconImageView.image = UIImage(named:"\(item.icon).png")
        self.summaryLabel.text = item.summary
    }
}
