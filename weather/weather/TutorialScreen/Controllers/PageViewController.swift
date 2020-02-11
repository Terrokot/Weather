//
//  PageViewController.swift
//  weather
//
//  Created by Egor Tereshonok on 2/11/20.
//  Copyright © 2020 Egor Tereshonok. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    let presentScreenContents = ["We need you location to show weather. If you dismiss you should go Settings -> Privacy -> Location Services and click allow while using app", "I hope you enjoy my app. \n Have a nice day 😉", ""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let contentPageVC = self.showViewControllerAtIndex(0) {
            setViewControllers([contentPageVC], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
    func showViewControllerAtIndex(_ index: Int) -> TutorialViewController? {
        
        guard index >= 0 else {
            return nil
        }
        guard index <= 2  else {
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "launchedBefore")
            dismiss(animated: false, completion: nil)
            return nil
        }
        
        
        guard let contentPageViewController = storyboard?.instantiateViewController(
            withIdentifier: "TutorialViewController") as? TutorialViewController else { return nil }
        
        contentPageViewController.presentText = presentScreenContents[index]
        contentPageViewController.currentPage = index
        contentPageViewController.numberOfPages = presentScreenContents.count
        
        return contentPageViewController
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    
    //  one page back
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! TutorialViewController).currentPage
        pageNumber -= 1
        return showViewControllerAtIndex(pageNumber)
    }
    
    // one page forward
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! TutorialViewController).currentPage
        pageNumber += 1
        return showViewControllerAtIndex(pageNumber)
    }
}
