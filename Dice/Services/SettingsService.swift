//
//  SettingsService.swift
//  Dice
//
//  Created by Michał Cichoń on 29/12/2018.
//  Copyright © 2018 Michal Cichon. All rights reserved.
//

import UIKit

class SettingsService {
    
    public static let shared = SettingsService()
    
    private let kDimmingEnabled = "kDimmingEnabled"
    
    var dimmingEnabled: Bool {
        get {
            return UserDefaults.standard.bool(forKey: kDimmingEnabled)
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: kDimmingEnabled)
            UIApplication.shared.isIdleTimerDisabled = !newValue
        }
    }
    
}
