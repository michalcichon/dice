//
//  DiceViewController.swift
//  Dice
//
//  Created by Michał Cichoń on 25/12/2018.
//  Copyright © 2018 Michal Cichon. All rights reserved.
//

import UIKit

class DiceViewController: UIViewController {

    private let colors = [#colorLiteral(red: 0, green: 0.7725490196, blue: 0.231372549, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.9294117647, green: 0.3215686275, blue: 0.2470588235, alpha: 1), #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), #colorLiteral(red: 0.6717925668, green: 0.0968252793, blue: 0.2592633367, alpha: 1)]
    
    @IBOutlet weak var diceView: DiceView!
    @IBOutlet weak var refreshButton: ShrinkButton!
    
    private var viewModel = DiceViewModel()
    
    private lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnView))
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colors.randomElement()
        view.addGestureRecognizer(tapGesture)
        becomeFirstResponder()
        refresh()
    }
    
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            userRefreshHandled()
        }
    }

    @IBAction func refreshAction(_ sender: Any) {
        userRefreshHandled()
    }
    
    @objc private func tapOnView() {
        refreshButton.didPress()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            self.refreshButton.didRelease()
        }
        userRefreshHandled()
    }
    
    private func userRefreshHandled() {
        refresh()
        refreshBackgroundColor()
        StatService.shared.increaseCounter()
    }
    
    private func refresh() {
        viewModel.roll()
        diceView.result = viewModel.result
    }
    
    private func refreshBackgroundColor() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options:[.curveEaseIn], animations: {
            let previousColor = self.view.backgroundColor
            var nextColor = self.colors.randomElement()
            while previousColor == nextColor {
                nextColor = self.colors.randomElement()
            }
            self.view.backgroundColor = nextColor
        }, completion:nil)
    }
    
}

