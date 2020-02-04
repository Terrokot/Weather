//
//  AppDelegate.swift
//  weather
//
//  Created by Egor Tereshonok on 2/3/20.
//  Copyright © 2020 Egor Tereshonok. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let locationService = LocationService()




     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
           
           // Location service callbacks
           locationService.newestLocation = { [weak self] coordinate in
               guard let self = self, let coordinate = coordinate else { return }
               print("Location is: \(coordinate)")
           }
           locationService.statusUpdated = { [weak self] status in
               if status == .authorizedWhenInUse {
                   self?.locationService.getLocation()
               }
           }
           
           switch locationService.status {
           case .notDetermined:
               locationService.getPermission()
           case .authorizedWhenInUse:
               locationService.getLocation()
           default: assertionFailure("Location is: \(locationService.status)")
           }
           return true
       }

    // MARK: UISceneSession Lifecycle


}

