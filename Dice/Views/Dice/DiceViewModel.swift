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

class DiceViewModel {
    
    lazy public var result: DiceResult = randResult()
    
    public func roll() {
        result = randResult()
    }
    
    private func randResult() -> DiceResult {
        let raw = Int(arc4random_uniform(6))
        return DiceResult(rawValue: raw)!
    }
}
