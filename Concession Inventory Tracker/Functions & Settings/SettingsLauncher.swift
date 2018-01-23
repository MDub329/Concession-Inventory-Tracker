//
//  SettingsLauncher.swift
//  Concession Inventory Tracker
//
//  Created by Matthew Wells on 1/22/18.
//  Copyright © 2018 Matthew Wells. All rights reserved.
//

import UIKit

class SettingsLauncher: NSObject{
    override init() {
        super.init()
        //
    }
    
    let blackView = UIView()
    
    @objc func showSettings() {
        if let window = UIApplication.shared.keyWindow {
            blackView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            window.addSubview(blackView)
            blackView.frame = window.frame
            blackView.alpha = 0
            UIView.animate(withDuration: 0.5, animations: {
                self.blackView.alpha = 0.5
            })
            
        }
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.5, animations: {
            self.blackView.alpha = 0
        })
    }
}
