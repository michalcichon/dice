//
//  StatService.swift
//  Dice
//
//  Created by Michał Cichoń on 26/12/2018.
//  Copyright © 2018 Michal Cichon. All rights reserved.
//

import Foundation

class StatService {
    
    public static let shared = StatService()
    
    private let kCounterKey = "kCounter"
    
    var counter: Int {
        get {
            return UserDefaults.standard.integer(forKey: kCounterKey)
        }
    }
    
    public func increaseCounter() {
        var counter = self.counter
        counter += 1
        UserDefaults.standard.set(counter, forKey: kCounterKey)
    }
    
}
