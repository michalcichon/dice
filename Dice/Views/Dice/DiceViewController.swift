//
//  DiceViewController.swift
//  Dice
//
//  Created by Michał Cichoń on 25/12/2018.
//  Copyright © 2018 Michal Cichon. All rights reserved.
//

import UIKit

class DiceViewController: UIViewController {

    private let colors = [#colorLiteral(red: 0, green: 0.7725490196, blue: 0.231372549, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.9843137255, green: 0.3725490196, blue: 0.1254901961, alpha: 1), #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), #colorLiteral(red: 0.4235294118, green: 0.2509803922, blue: 0.1333333333, alpha: 1), #colorLiteral(red: 0.8467822075, green: 0.127263248, blue: 0.2581181526, alpha: 1)]
    private let feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
    
    @IBOutlet weak var diceView: DiceView!
    @IBOutlet weak var rightSmallDiceView: DiceView!
    @IBOutlet weak var leftSmallDiceView: DiceView!
    
    @IBOutlet weak var rightSmallDiceContainerView: UIView!
    @IBOutlet weak var leftSmallDiceContainerView: UIView!
    
    @IBOutlet weak var refreshButton: ShrinkButton!
    @IBOutlet weak var twoDiceButton: UIButton!
    @IBOutlet weak var bulbButton: UIButton!
    
    private var viewModel = DiceViewModel()
    
    private lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnView))
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colors.randomElement()
        view.addGestureRecognizer(tapGesture)
        prepareHaptic()
        becomeFirstResponder()
        rollDice()
        refreshDiceToggle()
        refreshBulbToggle()
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
    
    @IBAction func toggleTwoDice(_ sender: Any) {
        viewModel.singleDieMode = !viewModel.singleDieMode
        refreshDiceViewVisibility()
    }
    
    @IBAction func bulbAction(_ sender: Any) {
        viewModel.dimmingEnabled = !viewModel.dimmingEnabled
        refreshBulbToggle()
    }
    
    @objc private func tapOnView() {
        refreshButton.didPress()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            self.refreshButton.didRelease()
        }
        userRefreshHandled()
    }
    
    private func userRefreshHandled() {
        rollDice()
        refreshBackgroundColor()
        StatService.shared.increaseGlobalCounter()
        makeHapticFeedback()
    }
    
    private func rollDice() {
        viewModel.roll()
        diceView.result = viewModel.result
        leftSmallDiceView.result = viewModel.resultLeft
        rightSmallDiceView.result = viewModel.resultRight
        refreshDiceViewVisibility()
    }
    
    private func refreshBackgroundColor() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options:[.curveEaseIn], animations: {
            let previousColor = self.view.backgroundColor
            var nextColor = self.colors.randomElement()
            while previousColor == nextColor {
                nextColor = self.colors.randomElement()
            }
            self.view.backgroundColor = nextColor
        }, completion:nil)
    }
    
    private func refreshDiceToggle() {
        if viewModel.singleDieMode {
            twoDiceButton.alpha = 0.5
        } else {
            twoDiceButton.alpha = 1.0
        }
    }
    
    private func refreshBulbToggle() {
        if viewModel.dimmingEnabled {
            bulbButton.alpha = 0.5
        } else {
            bulbButton.alpha = 1.0
        }
    }
    
    private func refreshDiceViewVisibility() {
        if viewModel.singleDieMode {
            rightSmallDiceContainerView.isHidden = true
            leftSmallDiceContainerView.isHidden = true
            diceView.isHidden = false
        } else {
            rightSmallDiceContainerView.isHidden = false
            leftSmallDiceContainerView.isHidden = false
            diceView.isHidden = true
        }
        
        refreshDiceToggle()
    }
    
    // MARK: Haptic generator
    
    private func prepareHaptic() {
        feedbackGenerator.prepare()
    }
    
    private func makeHapticFeedback() {
        feedbackGenerator.impactOccurred()
    }
    
}

