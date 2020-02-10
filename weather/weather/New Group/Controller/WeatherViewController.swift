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
    
    var viewModels: [DailyForecastCellModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    
    

/*
    let apiKey = "6571b4d1e6e40c1738783ad3c217c976"
    let networkService = NetworkService()
    override func viewDidLoad() {
        super.viewDidLoad()
        //networkService.testrequest()
    }

*/
// api.openweathermap.org/data/2.5/weather?q=Paris,&units=imperial&appid=6571b4d1e6e40c1738783ad3c217c976
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
        cell.temperatureLabel.text = "\(vm.low) - \(vm.high)ºF"
        cell.dayLabel.text = vm.dayOfTheWeek
        return cell
    }
    
    
}
