//
//  TutorialViewController.swift
//  weather
//
//  Created by Egor Tereshonok on 2/11/20.
//  Copyright © 2020 Egor Tereshonok. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    @IBOutlet var presentTextLabel: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    var presentText = ""
    var numberOfPages = 0
    var currentPage = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentTextLabel.text = presentText
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
    }

}
