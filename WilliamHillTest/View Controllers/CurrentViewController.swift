//
//  CurrentViewController.swift
//  WilliamHillTest
//
//  Created by Adam Balzan on 24/10/17.
//  Copyright © 2017 Adam Balzan. All rights reserved.
//

// Icons from https://www.dr-lex.be/software/darksky-icons.html

import UIKit

class CurrentViewController: UIViewController {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Current Forecast"
        // Do any additional setup after loading the view, typically from a nib.
        let dataRequest = DarkSkyDataRequest()
        dataRequest.getCurrentWeather { (current) in
            if let current = current {
                DispatchQueue.main.async {
                    self.iconImageView.image = UIImage(named:"\(current.icon).png")
                    self.summaryLabel.text = "\(current.summary)\nTemperature:\(current.displayTemperatureAsCelsius()) "
                }
            }
         }
    }

}

