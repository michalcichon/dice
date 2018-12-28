//
//  AppDelegate.swift
//  Dice
//
//  Created by Michał Cichoń on 25/12/2018.
//  Copyright © 2018 Michal Cichon. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Fabric.with([Crashlytics.self])
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        UserDefaults.standard.synchronize()
    }
}

