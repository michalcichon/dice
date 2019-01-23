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
    
    private let kGlobalCounterKey = "kCounter"
    private let kResultKey = "kResult_"
    
    var globalCounter: Int {
        get {
            return UserDefaults.standard.integer(forKey: kGlobalCounterKey)
        }
    }
    
    public func increaseGlobalCounter() {
        var counter = globalCounter
        counter += 1
        UserDefaults.standard.set(counter, forKey: kGlobalCounterKey)
    }
    
    public func valueCounter(result: DiceResult) -> Int {
        let key = kResultKey + result.description
        return UserDefaults.standard.integer(forKey: key)
    }
    
    public func increaseValueCounter(result: DiceResult) {
        let key = kResultKey + result.description
        var counter = valueCounter(result: result)
        counter += 1
        UserDefaults.standard.set(counter, forKey: key)
    }
    
}
