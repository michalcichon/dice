//
//  AboutViewController.swift
//  Dice
//
//  Created by Michał Cichoń on 25/12/2018.
//  Copyright © 2018 Michal Cichon. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var counterValueLabel: UILabel!
    @IBOutlet weak var visitWebsiteButton: UIButton!
    
    @IBOutlet weak var statsLabelOne: UILabel!
    @IBOutlet weak var statsLabelTwo: UILabel!
    @IBOutlet weak var statsLabelThree: UILabel!
    @IBOutlet weak var statsLabelFour: UILabel!
    @IBOutlet weak var statsLabelFive: UILabel!
    @IBOutlet weak var statsLabelSix: UILabel!
    
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func visitWebsite(_ sender: Any) {
        if let url = URL(string: "settings_privacy_policy_url".localized) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appName = infoString(key: "CFBundleName") ?? "app_name".localized
        let shortVersion = infoString(key: "CFBundleShortVersionString") ?? ""
        var bundlePart = ""
        if let bundleVersion = infoString(key: "CFBundleVersion") {
            bundlePart = "(\(bundleVersion))"
        }
        
        versionLabel.text = "\(appName) \(shortVersion) \(bundlePart)"
        descriptionLabel.text = "description".localized
        counterLabel.text = "settings_counter".localized
        counterValueLabel.text = String(StatService.shared.globalCounter)
        
        statsLabelOne.text = String(StatService.shared.valueCounter(result: .one))
        statsLabelTwo.text = String(StatService.shared.valueCounter(result: .two))
        statsLabelThree.text = String(StatService.shared.valueCounter(result: .three))
        statsLabelFour.text = String(StatService.shared.valueCounter(result: .four))
        statsLabelFive.text = String(StatService.shared.valueCounter(result: .five))
        statsLabelSix.text = String(StatService.shared.valueCounter(result: .six))
        
        visitWebsiteButton.setTitle("settings_privacy_policy".localized, for: .normal)
    }
    
    private func infoString(key: String) -> String? {
        if let infoDictionary = Bundle.main.infoDictionary {
            return infoDictionary[key] as? String
        }
        
        return nil
    }

}
