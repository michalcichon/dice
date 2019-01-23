//
//  DiceView.swift
//  Dice
//
//  Created by Michał Cichoń on 26/12/2018.
//  Copyright © 2018 Michal Cichon. All rights reserved.
//

import UIKit

class DiceView: UIView {
    
    private var radius: CGFloat {
        get {
            return bounds.width * 0.08
        }
    }
    private let color:  CGColor = UIColor.white.cgColor
    
    @IBInspectable public var initialResult: Int = 1 {
        didSet {
            result = DiceResult(rawValue: initialResult - 1)
        }
    }
    
    public var result: DiceResult? {
        didSet {
            refresh()
        }
    }
    
    private var circleA: CAShapeLayer!
    private var circleB: CAShapeLayer!
    private var circleC: CAShapeLayer!
    private var circleD: CAShapeLayer!
    private var circleE: CAShapeLayer!
    
    private var circleF: CAShapeLayer!
    private var circleG: CAShapeLayer!
    private var circleH: CAShapeLayer!
    private var circleI: CAShapeLayer!
    private var circleJ: CAShapeLayer!
    private var circleK: CAShapeLayer!

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        refresh()
    }
    
    private func makeCircle(x: CGFloat, y: CGFloat) -> CAShapeLayer {
        let circle = CAShapeLayer()
        circle.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 2.0 * radius, height: 2.0 * radius), cornerRadius: radius).cgPath
        circle.position = CGPoint(x: x - radius, y: y - radius)
        circle.fillColor = color
        return circle
    }
    
    private func refreshLayers() {
        layer.sublayers?.forEach({ (layer) in
            layer.removeFromSuperlayer()
        })
        
        makeAll()
    }
    
    private func refresh() {
        refreshLayers()
        
        if [DiceResult.one, DiceResult.three, DiceResult.five].contains(result) {
            layer.addSublayer(circleA)
        }
        
        if ([DiceResult.four, DiceResult.five].contains(result)) {
            layer.addSublayer(circleB)
        }
        
        if ([DiceResult.two, DiceResult.three, DiceResult.four, DiceResult.five].contains(result)) {
            layer.addSublayer(circleC)
        }
        
        if ([DiceResult.four, DiceResult.five].contains(result)) {
            layer.addSublayer(circleD)
        }
        
        if ([DiceResult.two, DiceResult.three, DiceResult.four, DiceResult.five].contains(result)) {
            layer.addSublayer(circleE)
        }
        
        if result == .six {
            layer.addSublayer(circleF)
            layer.addSublayer(circleG)
            layer.addSublayer(circleH)
            layer.addSublayer(circleI)
            layer.addSublayer(circleJ)
            layer.addSublayer(circleK)
        }
    }
    
    private func makeAll() {
        circleA = makeCircle(x: bounds.midX, y: bounds.midY)
        circleB = makeCircle(x: radius, y: radius)
        circleC = makeCircle(x: bounds.width - radius, y: radius)
        circleD = makeCircle(x: bounds.width - radius, y: bounds.height - radius)
        circleE = makeCircle(x: radius, y: bounds.height - radius)
        
        circleF = makeCircle(x: 2 * radius, y: radius)
        circleG = makeCircle(x: 2 * radius, y: bounds.midY)
        circleH = makeCircle(x: 2 * radius, y: bounds.height - radius)
        circleI = makeCircle(x: bounds.width - 2 * radius, y: radius)
        circleJ = makeCircle(x: bounds.width - 2 * radius, y: bounds.midY)
        circleK = makeCircle(x: bounds.width - 2 * radius, y: bounds.height - radius)
    }

}
