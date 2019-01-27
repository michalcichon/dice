//
//  Toast.swift
//  Dice
//
//  Created by Michał Cichoń on 27/01/2019.
//  Copyright © 2019 Michal Cichon. All rights reserved.
//

import UIKit


class Toast: UIView {
    
    @IBOutlet weak var label: UILabel!
    public static func present(text: String) {
        if let toast = getToastView(), let topmostView = getTopmostView() {
            toast.alpha = 0.0
            topmostView.addSubview(toast)
            toast.translatesAutoresizingMaskIntoConstraints = false
            toast.topAnchor.constraint(equalTo: topmostView.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
            toast.trailingAnchor.constraint(equalTo: topmostView.trailingAnchor, constant: -20).isActive = true
            toast.leadingAnchor.constraint(equalTo: topmostView.leadingAnchor, constant: 20).isActive = true
            
            UIView.animate(withDuration: 0.3, animations: {
                toast.alpha = 1.0
            }) { (finished) in
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    dismiss(toast: toast)
                }
            }
            
            toast.label.text = text
        }
    }
    
    private static func dismiss(toast: Toast) {
        UIView.animate(withDuration: 0.3, animations: {
            toast.alpha = 0.0
        }, completion: { (finished) in
            toast.removeFromSuperview()
        })
    }
    
    private static func getTopmostView() -> UIView? {
        return UIApplication.shared.keyWindow?.rootViewController?.view
    }
    
    private static func getToastView() -> Toast? {
        return Bundle.main.loadNibNamed("Toast", owner: self, options: nil)?[0] as? Toast
    }
    
}
