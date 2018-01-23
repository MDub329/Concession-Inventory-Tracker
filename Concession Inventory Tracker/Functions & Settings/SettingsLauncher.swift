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
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1)
        return cv
    }()
    
    @objc func showSettings() {
        if let window = UIApplication.shared.keyWindow {
            blackView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            window.addSubview(collectionView)
            let height: CGFloat = 400
            let y = window.frame.height - height
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 0.5
                
                self.collectionView.frame = CGRect(x: 0, y: y, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
                
            }, completion: nil)
            
        }
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.5, animations: {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow{
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: window.frame.height)
            }
            
        })
    }
}
