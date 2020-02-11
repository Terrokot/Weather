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
    @IBOutlet var locationBar: UINavigationItem!
    
       var viewModels: [DailyForecastCellModel] = [] {
           didSet {
               tableView.reloadData()
           }
       }
    
    override func viewWillLayoutSubviews() {
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "back3")?.draw(in: self.view.bounds)

        if let image = UIGraphicsGetImageFromCurrentImageContext(){
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
        }else{
            UIGraphicsEndImageContext()
            debugPrint("Image not available")
         }
        tableView.backgroundColor = .clear
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startPresentation()
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.40, green:0.51, blue:0.66, alpha:1.0)
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
}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as! DailyForecastTableViewCell
        let vm = viewModels[indexPath.row]
        cell.backgroundColor = .clear
        cell.forecastImageView.image = vm.image
        cell.temperatureLabel.text = "\(vm.low - 32) ... \(vm.high - 32)ºC"
        cell.dayLabel.text = vm.dayOfTheWeek
        return cell
    }
}
