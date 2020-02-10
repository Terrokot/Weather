//
//  ForecastService.swift
//  weather
//
//  Created by Egor Tereshonok on 2/5/20.
//  Copyright © 2020 Egor Tereshonok. All rights reserved.
//

import Moya

enum ForecastProvider {
    case forecast(String, Double, Double)
}

extension ForecastProvider: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.darksky.net")!
    }
    
    var path: String {
        switch self {
        case let .forecast(apiKey, lat, long):
            return "/forecast/\(apiKey)/\(lat),\(long)"
        }
    }
    
    var method: Method {
        switch self {
        case .forecast:
            return .get
        }
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .forecast:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }

}
