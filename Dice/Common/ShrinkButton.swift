//
//  ShrinkButton.swift
//  Dice
//
//  Created by Michał Cichoń on 26/12/2018.
//  Copyright © 2018 Michal Cichon. All rights reserved.
//

import UIKit

class ShrinkButton: UIButton {
    
    var scale: CGFloat = 0.8
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTargets()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTargets()
    }
    
    func setupTargets() {
        addTarget(self, action: #selector(didPress), for: .touchDown)
        addTarget(self, action: #selector(didRelease), for: .touchUpOutside)
        addTarget(self, action: #selector(didRelease), for: .touchUpInside)
        addTarget(self, action: #selector(didRelease), for: .touchCancel)
    }
    
    @objc func didPress() {
        UIView.animate(withDuration: 0.1) {
            self.transform = CGAffineTransform(scaleX: self.scale, y: self.scale)
        }
    }
    
    @objc func didRelease() {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
}
