//
//  EventsLogger.swift
//  Dice
//
//  Created by Michał Cichoń on 03/01/2019.
//  Copyright © 2019 Michal Cichon. All rights reserved.
//

import Foundation
import Crashlytics

struct EventsLoggerConstants {
    static let trueValue = "True"
    static let falseValue = "False"
}

class EventsLogger {
    
    private typealias C = EventsLoggerConstants
    
    public static let shared = EventsLogger()
    
    public func logTwoDiceToggle(on: Bool) {
        let attributes = [
            "On": on ? C.trueValue : C.falseValue
        ]
        
        logEvent(eventName: "TwoDiceToggle", attributes: attributes)
        
    }
    
    public func logPreventDimmingToggle(on: Bool) {
        let attributes = [
            "On": on ? C.trueValue : C.falseValue
        ]
        
        logEvent(eventName: "PreventDimmingToggle", attributes: attributes)
    }
    
    public func logRollByButtonTap() {
        logEvent(eventName: "RollByButtonTap", attributes: nil)
    }
    
    public func logRollByScreenTap() {
        logEvent(eventName: "RollByScreenTap", attributes: nil)
    }
    
    // MARK: -
    
    private func logEvent(eventName: String, attributes: [String : Any]?) {
        Answers.logCustomEvent(withName: eventName, customAttributes: attributes)
    }
    
}
