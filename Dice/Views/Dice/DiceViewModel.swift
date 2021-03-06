//
//  DiceViewModel.swift
//  Dice
//
//  Created by Michał Cichoń on 25/12/2018.
//  Copyright © 2018 Michal Cichon. All rights reserved.
//

import Foundation

enum DiceResult: Int {
    case one = 0
    case two = 1
    case three = 2
    case four = 3
    case five = 4
    case six = 5
}

extension DiceResult: CustomStringConvertible {
    var description: String {
        return String(rawValue)
    }
}

class DiceViewModel {
    
    private let kSingleDieModeKey = "kSingleDieMode"
    
    lazy public var result: DiceResult = randResult()
    lazy public var resultRight: DiceResult = randResult()
    lazy public var resultLeft: DiceResult = randResult()
    public var singleDieMode: Bool {
        get {
            return UserDefaults.standard.bool(forKey: kSingleDieModeKey)
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: kSingleDieModeKey)
        }
    }
    
    public var dimmingEnabled: Bool {
        get {
            return SettingsService.shared.dimmingEnabled
        }
        
        set {
            SettingsService.shared.dimmingEnabled = newValue
        }
    }
    
    public func roll() {
        if singleDieMode {
            rollOneDie()
        } else {
            rollTwoDice()
        }
    }
    
    private func rollOneDie() {
        result = randResult()
        StatService.shared.increaseValueCounter(result: result)
    }
    
    public func rollTwoDice() {
        resultRight = randResult()
        StatService.shared.increaseValueCounter(result: resultRight)
        resultLeft = randResult()
        StatService.shared.increaseValueCounter(result: resultLeft)
    }
    
    private func randResult() -> DiceResult {
        let raw = Int(arc4random_uniform(6))
        return DiceResult(rawValue: raw)!
    }
}
