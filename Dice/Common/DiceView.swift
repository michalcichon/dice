//
//  DiceView.swift
//  Dice
//
//  Created by Michał Cichoń on 26/12/2018.
//  Copyright © 2018 Michal Cichon. All rights reserved.
//

import UIKit

class DiceView: UIView {
    
    var cicleA: CAShapeLayer!
    var cicleB: CAShapeLayer!
    var cicleC: CAShapeLayer!
    var cicleD: CAShapeLayer!
    var cicleE: CAShapeLayer!

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if cicleA == nil {
            cicleA = CAShapeLayer()
            let radius: CGFloat = 20
            cicleA.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 2.0 * radius, height: 2.0 * radius), cornerRadius: radius).cgPath
            cicleA.position = CGPoint(x: frame.midX - radius, y: frame.midY - radius)
            cicleA.fillColor = UIColor.blue.cgColor
            layer.addSublayer(cicleA)
        }
    }

}
