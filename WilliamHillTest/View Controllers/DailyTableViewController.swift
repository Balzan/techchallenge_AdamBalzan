//
//  DailyTableViewController.swift
//  WilliamHillTest
//
//  Created by Adam Balzan on 24/10/17.
//  Copyright © 2017 Adam Balzan. All rights reserved.
//

import UIKit

class DailyTableViewController: UITableViewController {

    var items = [DailyWeatherModal]()
    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Daily Forecast"
        dateFormatter.dateFormat = "MMMM d, YYYY"
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "Pull down to refresh")
        self.refreshControl?.addTarget(self, action: #selector(refreshData), for: UIControlEvents.valueChanged)
        refreshData()
    }
    
    @objc func refreshData(){
        let dataRequest = DarkSkyDataRequest()
        self.refreshControl?.endRefreshing()
        dataRequest.getDailyWeatherFeed(completion: { (items) in
            self.items = items
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherCell
        cell.setupDailyCell(item: self.items[indexPath.row], dateFormatter: dateFormatter)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "detailsPush", sender: self.items[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsPush" {
            let detailsViewController = segue.destination as! DetailsViewController
            detailsViewController.loadViewIfNeeded()
            detailsViewController.configure(dailyWeatherModal:(sender as! DailyWeatherModal))
        }
    }
  

}
