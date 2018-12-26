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
    
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
    }
    
    private func infoString(key: String) -> String? {
        if let infoDictionary = Bundle.main.infoDictionary {
            return infoDictionary[key] as? String
        }
        
        return nil
    }

}
