//
//  DailyTableViewCell.swift
//  weather
//
//  Created by Egor Tereshonok on 2/10/20.
//  Copyright © 2020 Egor Tereshonok. All rights reserved.
//

import UIKit

class DailyForecastTableViewCell: UITableViewCell {
    
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var forecastImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
