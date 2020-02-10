//
//  NetworkService.swift
//  weather
//
//  Created by Egor Tereshonok on 2/4/20.
//  Copyright © 2020 Egor Tereshonok. All rights reserved.
//

import Foundation
import Alamofire

protocol Networking {
    func requestA(path: String, params: [String: String], completion: @escaping (Data?, Error?) -> Void)
}

final class NetworkService: Networking {
    
    func requestA(path: String, params: [String : String], completion: @escaping (Data?, Error?) -> Void) {
       // AF.request("http://api.openweathermap.org/data/2.5/weather?q=Paris,&units=imperial&appid=6571b4d1e6e40c1738783ad3c217c976").responseJSON { (response) in
           // print(response)
        //}
    }
    
    func testrequest() {
        request("https://api.darksky.net/forecast/fd56c5c69f6ff8567bf14ef3c8072423/53.902791,27.558383").responseJSON { (response) in
           print(response)
        }
    }
}
