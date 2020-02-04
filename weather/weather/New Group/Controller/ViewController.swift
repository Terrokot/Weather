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


class ViewController: UIViewController {
    

    let apiKey = "6571b4d1e6e40c1738783ad3c217c976"
    let networkService = NetworkService()
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.testrequest()
    }
}

// api.openweathermap.org/data/2.5/weather?q=Paris,&units=imperial&appid=6571b4d1e6e40c1738783ad3c217c976

