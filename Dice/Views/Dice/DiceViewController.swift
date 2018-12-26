//
//  DiceViewController.swift
//  Dice
//
//  Created by Michał Cichoń on 25/12/2018.
//  Copyright © 2018 Michal Cichon. All rights reserved.
//

import UIKit

class DiceViewController: UIViewController {

    @IBOutlet weak var diceView: DiceView!
    
    private var viewModel = DiceViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
    }

    @IBAction func refreshAction(_ sender: Any) {
        refresh()
    }
    
    private func refresh() {
        viewModel.roll()
        diceView.result = viewModel.result
    }
    
}

