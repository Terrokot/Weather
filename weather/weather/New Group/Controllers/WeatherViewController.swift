//
//  ViewController.swift
//  weather
//
//  Created by Egor Tereshonok on 2/3/20.
//  Copyright © 2020 Egor Tereshonok. All rights reserved.
//

import UIKit
import Foundation
import Alamofire


class WeatherViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startPresentation()
    }
    
    func startPresentation() {
        
        let userDefaults = UserDefaults.standard
        let launchedBefore = userDefaults.bool(forKey: "launchedBefore")
        if launchedBefore == false {
            
            // PageViewController
            if let pageViewController = storyboard?.instantiateViewController(
                withIdentifier: "PageViewController") as? PageViewController {
                pageViewController.modalPresentationStyle = .fullScreen
                self.present(pageViewController, animated: true, completion: nil)
            }
        }
    }
    
    var viewModels: [DailyForecastCellModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
}

extension WeatherViewController: UITableViewDelegate {
}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as! DailyForecastTableViewCell
        let vm = viewModels[indexPath.row]
        cell.forecastImageView.image = vm.image
        cell.temperatureLabel.text = "\(vm.low - 32) - \(vm.high - 32)ºC"
        cell.dayLabel.text = vm.dayOfTheWeek
        return cell
    }
}
