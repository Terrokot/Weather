//
//  DailyTableViewCellModel.swift
//  weather
//
//  Created by Egor Tereshonok on 2/10/20.
//  Copyright © 2020 Egor Tereshonok. All rights reserved.
//

import Foundation
import UIKit
struct DailyForecastCellModel {
    let dayOfTheWeek: String
    let high: Int
    let low: Int
    let image: UIImage?
    static func format(_ date: Date) -> String {
        let formater = DateFormatter()
        formater.dateFormat = "EEEE"
        return formater.string(from: date)
    }
}

extension DailyForecastCellModel {
    init?(dailyForecast: DailyDatum ) {
        let date = Date(timeIntervalSince1970: TimeInterval(dailyForecast.time))
        dayOfTheWeek = DailyForecastCellModel.format(date)
        high = Int(dailyForecast.temperatureHigh)
        low = Int(dailyForecast.temperatureLow)
        image = UIImage(named: dailyForecast.icon)

        
    }
}
